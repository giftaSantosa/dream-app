class ImageGenerationJob < ApplicationJob
  queue_as :default

  def perform(dream, result)
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
