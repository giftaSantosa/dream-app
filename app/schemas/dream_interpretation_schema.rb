require "ruby_llm/schema"

class DreamInterpretationSchema < RubyLLM::Schema
  string :dream_title,
         description: "A short creative title for the dream"

  string :summary,
         description: "A short interpretation of the dream"

  array :dream_themes,
        of: :string,
        description: "Main themes found in the dream. Each theme must be exactly one word. Example: fear, freedom, anxiety, change"

  array :dream_symbols,
        of: :string,
        description: "Important symbols found in the dream. Each symbol must be exactly one word. Example: water, moon, house, snake"
end
