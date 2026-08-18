puts "Cleaning dreams..."
Dream.destroy_all

dreams = [
  {
    title: "The Melting Face",
    date: Date.today - 1,
    input: "I looked into a mirror and my face slowly started melting. I tried to touch it, but my hands passed through my reflection.",
    mood: "Scared",
    interpretation: {
      summary: "This dream may reflect anxiety about identity or changes in how you see yourself.",
      themes: ["identity", "change", "anxiety"],
      symbols: ["mirror", "melting face", "reflection"]
    }
  },
  {
    title: "Flying Over Tokyo",
    date: Date.today - 2,
    input: "I was flying above a huge city at night. I could see all the lights below me and felt completely free.",
    mood: "Happy",
    interpretation: {
      summary: "Flying dreams can represent freedom, confidence, or a desire to escape limitations.",
      themes: ["freedom", "confidence", "escape"],
      symbols: ["flying", "city", "lights"]
    }
  },
  {
    title: "The Endless Hallway",
    date: Date.today - 3,
    input: "I was walking through a hallway with hundreds of doors. Every time I opened one, there was another hallway behind it.",
    mood: "Confused",
    interpretation: {
      summary: "The endless choices may symbolize uncertainty or difficulty deciding which direction to take.",
      themes: ["choices", "uncertainty", "searching"],
      symbols: ["hallway", "doors"]
    }
  },
  {
    title: "Teeth Falling Out",
    date: Date.today - 4,
    input: "I was talking to someone when my teeth suddenly started falling out one by one. I tried to hide it from everyone.",
    mood: "Embarrassed",
    interpretation: {
      summary: "This common dream may relate to vulnerability, self-image, communication, or fear of embarrassment.",
      themes: ["vulnerability", "self-image", "communication"],
      symbols: ["teeth"]
    }
  },
  {
    title: "The Giant Wave",
    date: Date.today - 5,
    input: "I was standing on a beach when an enormous wave appeared. Everyone ran, but I just stood there watching it come toward me.",
    mood: "Overwhelmed",
    interpretation: {
      summary: "The wave could symbolize powerful emotions or a situation that feels too large to control.",
      themes: ["emotion", "stress", "acceptance"],
      symbols: ["ocean", "wave", "beach"]
    }
  },
  {
    title: "Back at School",
    date: Date.today - 6,
    input: "I was back at school and suddenly realized I had an exam. I hadn't studied anything and couldn't even find the classroom.",
    mood: "Anxious",
    interpretation: {
      summary: "This may reflect feelings of being unprepared, evaluated, or under pressure.",
      themes: ["pressure", "performance", "uncertainty"],
      symbols: ["school", "exam", "classroom"]
    }
  },
  {
    title: "The Talking Cat",
    date: Date.today - 7,
    input: "A black cat followed me home and started talking to me. It told me not to open the door to my apartment.",
    mood: "Curious",
    interpretation: {
      summary: "The talking cat may represent intuition or an internal voice warning you about something.",
      themes: ["intuition", "warning", "curiosity"],
      symbols: ["cat", "door", "home"]
    }
  },
  {
    title: "Running but Going Nowhere",
    date: Date.today - 8,
    input: "Something was chasing me through a forest. I kept running as fast as possible, but I barely moved.",
    mood: "Terrified",
    interpretation: {
      summary: "Being chased while unable to escape may symbolize avoidance, pressure, or feeling stuck.",
      themes: ["fear", "avoidance", "frustration"],
      symbols: ["forest", "chase", "running"]
    }
  },
  {
    title: "The Hidden Room",
    date: Date.today - 9,
    input: "I discovered a room in my house that I had never seen before. It was full of old photographs and objects I didn't recognize.",
    mood: "Curious",
    interpretation: {
      summary: "Discovering an unknown room may represent uncovering unfamiliar parts of yourself or forgotten memories.",
      themes: ["discovery", "memory", "identity"],
      symbols: ["house", "hidden room", "photographs"]
    }
  },
  {
    title: "Underwater City",
    date: Date.today - 10,
    input: "I was walking through a city completely underwater, but somehow I could breathe normally. Fish were swimming between the buildings.",
    mood: "Peaceful",
    interpretation: {
      summary: "Being comfortable underwater may suggest feeling at ease while exploring deep emotions or the unconscious.",
      themes: ["emotion", "exploration", "calm"],
      symbols: ["water", "city", "fish"]
    }
  },
  {
    title: "Missing the Train",
    date: Date.today - 11,
    input: "I was running through a station trying to catch a train. Every time I reached the platform, the train had just left.",
    mood: "Frustrated",
    interpretation: {
      summary: "Missing transportation may represent anxiety about opportunities, timing, or falling behind.",
      themes: ["opportunity", "time", "frustration"],
      symbols: ["train", "station", "clock"]
    }
  },
  {
    title: "The Empty City",
    date: Date.today - 12,
    input: "I walked through a huge city in the middle of the day, but there wasn't a single person anywhere.",
    mood: "Lonely",
    interpretation: {
      summary: "An empty city may symbolize isolation, independence, or feeling disconnected from other people.",
      themes: ["loneliness", "isolation", "independence"],
      symbols: ["city", "empty streets"]
    }
  },
  {
    title: "The Endless Staircase",
    date: Date.today - 13,
    input: "I was climbing a staircase inside a tower. I could see the top, but no matter how long I climbed, it never got closer.",
    mood: "Exhausted",
    interpretation: {
      summary: "The endless climb may represent ambition, frustration, or pursuing a goal that feels distant.",
      themes: ["ambition", "progress", "frustration"],
      symbols: ["stairs", "tower"]
    }
  },
  {
    title: "The Second Moon",
    date: Date.today - 14,
    input: "I looked at the night sky and saw two moons. Everyone around me acted like it was normal, but I knew something was wrong.",
    mood: "Uneasy",
    interpretation: {
      summary: "The unfamiliar moon may represent noticing a change or contradiction that others seem to ignore.",
      themes: ["change", "perception", "uncertainty"],
      symbols: ["moon", "night sky"]
    }
  }
]

dreams.each do |dream|
  Dream.create!(
    **dream,
    user: User.first,
    system_prompt: "You are a thoughtful dream interpretation assistant. Explore possible meanings without presenting interpretations as facts."
  )
end

puts "Created #{Dream.count} dreams!"
