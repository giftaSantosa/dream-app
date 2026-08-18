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

      chat = RubyLLM.chat.with_schema(DreamInterpretationSchema)

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
end
