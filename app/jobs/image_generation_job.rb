class ImageGenerationJob < ApplicationJob
  include ActionView::RecordIdentifier

  queue_as :default

  def perform(dream, result)
    image_prompt = "Make a surreal illustration representing #{result['summary']}. The illustration style should take consideration of themes like #{result['dream_themes']}, and symbols like #{result['dream_symbols']}. If given any, my mood on that dream is #{dream.mood}. Turn the dream into a bizarre visual scene that feels like dream logic taken too literally. Exaggerate the strangest details and add subtle visual humor, unexpected scale, awkward situations, or absurd combinations of objects. The image should still clearly reference the important symbols and events from the dream. Style: whimsical surrealism, playful, slightly weird, cinematic lighting, expressive characters, rich details, dreamlike atmosphere, humorous but not childish. Do not include text, captions, speech bubbles, logos, or explanations."

    image = RubyLLM.paint(image_prompt)

    dream.image.attach(
      io: StringIO.new(image.to_blob),
      filename: "dream_#{dream.id}.png",
      content_type: image.mime_type || "image/png"
      # key: "#{Rails.env}/dream_#{dream.id}_#{SecureRandom.hex(8)}.png"
    )
    # rescue RubyLLM::Error => e
    #   Rails.logger.error("Image generation failed for Dream ##{dream.id}: #{e.message}")
    # swallow the error so a failed image doesn't block the redirect
    Turbo::StreamsChannel.broadcast_replace_to(dream, target: dom_id(dream), partial: "shared/show_image",
                                                      locals: { dream: dream })
  end
end
