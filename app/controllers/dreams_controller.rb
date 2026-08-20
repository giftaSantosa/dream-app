class DreamsController < ApplicationController
  # skip_before_action :authenticate_user!
  PROMPT = "You are an experienced dream analyzer who combines mystical and scientific interpretation.
  You will receive an interpreted dream and answer follow-up questions about it. Keep responses concise
  (max 5 sentences) and end with a brief practical recommendation."
  def index
    @dreams = Dream.all
  end

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = User.first
    if @dream.save
      chat = RubyLLM.chat.with_schema(DreamInterpretationSchema).with_temperature(0.8)
      response = chat.ask(
        "Interpret this dream: #{@dream.input}. The dreamer's mood was #{@dream.mood}. Considering you're #{PROMPT}"
      )
      result = response.content
      @dream.update!(
        title: result["dream_title"],
        interpretation: {
          summary: result["summary"],
          dream_themes: result["dream_themes"],
          dream_symbols: result["dream_symbols"]
        }
      )
      @dream.dream_themes.each do |theme|
        @dream.theme_list.add(theme)
      end

      @dream.dream_symbols.each do |symbol|
        @dream.symbol_list.add(symbol)
      end
      @dream.save

      # generate_dream_image(@dream, result)
      ImageGenerationJob.perform_later(@dream, result)

      redirect_to dream_path(@dream)

    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def update
  end

  private

  def dream_params
    params.require(:dream).permit(:input, :date, :mood)
  end

  def generate_dream_image(dream, result)
    image_prompt = "Make a surreal, dream-like ghibli-styled animation illustration representing #{result['summary']}. Take consideration of themes like #{result['dream_themes']}, and symbols like #{result['dream_symbols']}. If given any, my mood on that dream is #{dream.mood}"

    image = RubyLLM.paint(image_prompt)

    dream.image.attach(
      io: StringIO.new(image.to_blob),
      filename: "dream_#{dream.id}.png",
      content_type: image.mime_type || "image/png",
      key: "#{Rails.env}/dream_#{dream.id}_#{SecureRandom.hex(8)}.png"
    )
  rescue RubyLLM::Error => e
    Rails.logger.error("Image generation failed for Dream ##{dream.id}: #{e.message}")
    # swallow the error so a failed image doesn't block the redirect
  end
end
