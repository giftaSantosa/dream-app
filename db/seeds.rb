user = User.first_or_create!(
  email: "test@mail.com",
  password: "secret"
)
puts "Cleaning dreams..."
Dream.destroy_all

dreams = [
  {
    title: "The Endless Fall",
    input: "I was falling from a very tall building, but I never reached the ground. I kept falling through clouds and could see the city getting smaller above me.",
    mood: "Anxious",
    summary: "Falling endlessly may reflect a feeling of losing control or uncertainty in your waking life.",
    themes: %w[anxiety control uncertainty],
    symbols: %w[falling building clouds city]
  },
  {
    title: "Ocean Without End",
    input: "I was swimming alone in a huge dark ocean. I couldn't see any land, but strangely I wasn't scared.",
    mood: "Calm",
    summary: "The endless ocean may represent exploring deep emotions while feeling comfortable with uncertainty.",
    themes: %w[peace solitude emotion],
    symbols: %w[ocean water darkness]
  },
  {
    title: "The Hidden Room",
    input: "I discovered a room in my house that I had never seen before. It was full of old books and photographs.",
    mood: "Curious",
    summary: "Discovering a hidden room can symbolize finding unexplored parts of yourself or forgotten memories.",
    themes: %w[discovery memory identity],
    symbols: %w[room house books photographs]
  },
  {
    title: "Flying Over Tokyo",
    input: "I could fly over the city at night. I flew between skyscrapers and watched all the lights below me.",
    mood: "Excited",
    summary: "Flying often represents freedom, ambition, and the desire to rise above everyday limitations.",
    themes: %w[freedom ambition adventure],
    symbols: %w[flying city lights skyscrapers]
  },
  {
    title: "The Giant Wave",
    input: "I was standing on a beach when an enormous wave appeared. Everyone ran but I just stood there watching it.",
    mood: "Scared",
    summary: "A giant wave may represent powerful emotions or circumstances that feel overwhelming.",
    themes: %w[fear change emotion],
    symbols: %w[wave ocean beach water]
  },
  {
    title: "Teeth Like Sand",
    input: "My teeth started falling out one by one. Every time I touched one it turned into sand in my hand.",
    mood: "Anxious",
    summary: "Losing teeth may symbolize insecurity, vulnerability, or anxiety about change and self-image.",
    themes: %w[insecurity change vulnerability],
    symbols: %w[teeth sand mouth]
  },
  {
    title: "The White Wolf",
    input: "A white wolf followed me through a snowy forest. I thought it was hunting me, but eventually it sat beside me.",
    mood: "Confused",
    summary: "The wolf may represent an instinctive or powerful part of yourself that initially feels threatening.",
    themes: %w[instinct trust fear],
    symbols: %w[wolf snow forest]
  },
  {
    title: "Late Again",
    input: "I was running to catch a train but every street kept changing. When I finally reached the station the train was leaving.",
    mood: "Stressed",
    summary: "Missing transportation can reflect anxiety about opportunities, deadlines, or falling behind.",
    themes: %w[pressure opportunity anxiety],
    symbols: %w[train station streets clock]
  },
  {
    title: "Moonlit Garden",
    input: "I walked through a garden at night where every flower was glowing blue under a huge moon.",
    mood: "Peaceful",
    summary: "A glowing garden may symbolize inner growth, imagination, and emotional renewal.",
    themes: %w[growth peace wonder],
    symbols: %w[garden flowers moon night]
  },
  {
    title: "The Locked Door",
    input: "There was a red door at the end of a hallway. I desperately wanted to open it but I couldn't find the key.",
    mood: "Frustrated",
    summary: "A locked door may represent an opportunity, answer, or part of yourself that currently feels inaccessible.",
    themes: %w[frustration mystery opportunity],
    symbols: %w[door hallway key]
  },
  {
    title: "Underwater City",
    input: "I was walking through a city completely underwater, but somehow I could breathe normally. Fish were swimming through buildings.",
    mood: "Amazed",
    summary: "Breathing underwater may suggest becoming comfortable navigating deep emotions or unfamiliar situations.",
    themes: %w[adaptation emotion discovery],
    symbols: %w[water city fish buildings]
  },
  {
    title: "The Empty School",
    input: "I went back to my old school but nobody was there. All the classrooms were empty and the clocks had stopped.",
    mood: "Nostalgic",
    summary: "Returning to an empty school may reflect memories of personal growth and awareness of time passing.",
    themes: %w[memory growth nostalgia],
    symbols: %w[school classroom clocks]
  },
  {
    title: "Running From Shadows",
    input: "Dark shadows were chasing me through narrow streets. Every time I looked back they were getting closer.",
    mood: "Terrified",
    summary: "Being chased by shadows may represent avoiding fears, responsibilities, or unresolved emotions.",
    themes: %w[fear avoidance pressure],
    symbols: %w[shadows streets darkness]
  },
  {
    title: "Golden Bird",
    input: "A tiny golden bird landed on my hand and started speaking to me, but I couldn't understand what it was saying.",
    mood: "Curious",
    summary: "The speaking bird may symbolize intuition or an important message that you have not yet understood.",
    themes: %w[intuition mystery communication],
    symbols: %w[bird gold hand]
  },
  {
    title: "The Broken Bridge",
    input: "I needed to cross a bridge, but the middle section was missing. I could see my friends waiting on the other side.",
    mood: "Lonely",
    summary: "A broken bridge may symbolize difficulty connecting with others or moving into a new stage of life.",
    themes: %w[connection transition isolation],
    symbols: %w[bridge river friends]
  },
  {
    title: "House in the Clouds",
    input: "I lived in a small wooden house floating above the clouds. I could see mountains far below.",
    mood: "Happy",
    summary: "A home above the clouds may represent escape, independence, and a desire for perspective.",
    themes: %w[freedom escape peace],
    symbols: %w[house clouds mountains sky]
  },
  {
    title: "The Mirror Stranger",
    input: "I looked into a mirror but the person looking back wasn't me. They smiled even though I wasn't smiling.",
    mood: "Uneasy",
    summary: "An unfamiliar reflection may represent questions about identity or aspects of yourself that feel unfamiliar.",
    themes: %w[identity uncertainty change],
    symbols: %w[mirror face reflection]
  },
  {
    title: "Forest of Doors",
    input: "I was walking through a forest where doors were standing between the trees. Each door led somewhere completely different.",
    mood: "Excited",
    summary: "Many doors can symbolize possibilities, choices, and curiosity about different paths in life.",
    themes: %w[choice possibility adventure],
    symbols: %w[forest doors trees]
  },
  {
    title: "The Tiny Planet",
    input: "I was standing on a planet so small that I could walk around the entire world in a few minutes.",
    mood: "Playful",
    summary: "A tiny world may represent a desire for simplicity, control, or a new perspective on your surroundings.",
    themes: %w[simplicity perspective control],
    symbols: %w[planet world stars]
  },
  {
    title: "Rain Inside",
    input: "It started raining inside my apartment. The rain only fell in my bedroom while every other room stayed dry.",
    mood: "Sad",
    summary: "Rain inside a private space may represent emotions that are being experienced internally or privately.",
    themes: %w[sadness emotion privacy],
    symbols: %w[rain bedroom house water]
  },
  {
    title: "The Endless Staircase",
    input: "I kept climbing a staircase that never ended. I was exhausted but could see bright light somewhere above me.",
    mood: "Determined",
    summary: "An endless climb may symbolize persistence toward a goal that still feels distant.",
    themes: %w[ambition persistence struggle],
    symbols: %w[stairs light tower]
  },
  {
    title: "Talking Cat",
    input: "My cat suddenly started talking to me like a person. It told me I was forgetting something important.",
    mood: "Surprised",
    summary: "A talking animal may represent intuition drawing attention to something overlooked.",
    themes: %w[intuition memory communication],
    symbols: %w[cat voice home]
  },
  {
    title: "Desert Train",
    input: "I was riding an old train through an endless desert. I was the only passenger and didn't know where it was going.",
    mood: "Lonely",
    summary: "Traveling alone toward an unknown destination may reflect uncertainty about your current direction.",
    themes: %w[uncertainty journey solitude],
    symbols: %w[train desert tracks]
  },
  {
    title: "The Black Sun",
    input: "The sun suddenly turned completely black in the middle of the day and everyone stopped moving.",
    mood: "Afraid",
    summary: "A darkened sun may symbolize sudden uncertainty, loss of clarity, or fear of dramatic change.",
    themes: %w[fear uncertainty change],
    symbols: %w[sun darkness sky]
  },
  {
    title: "Butterfly Storm",
    input: "Thousands of butterflies filled the sky and surrounded me. I couldn't see anything except their wings.",
    mood: "Amazed",
    summary: "Butterflies often symbolize transformation, while their overwhelming number may suggest rapid change.",
    themes: %w[transformation beauty change],
    symbols: %w[butterflies wings sky]
  },
  {
    title: "Childhood Home",
    input: "I was back inside the house where I grew up. Everything looked exactly the same, but I knew nobody lived there anymore.",
    mood: "Nostalgic",
    summary: "A childhood home may symbolize memories, identity, and reflection on how much you have changed.",
    themes: %w[memory identity nostalgia],
    symbols: %w[house childhood rooms]
  },
  {
    title: "Invisible Crowd",
    input: "I was standing in the middle of a crowded street but nobody could see or hear me.",
    mood: "Lonely",
    summary: "Being invisible may reflect feelings of disconnection or a desire to be recognized and understood.",
    themes: %w[isolation recognition connection],
    symbols: %w[crowd street people]
  },
  {
    title: "The Volcano",
    input: "I watched a volcano erupt in the distance. Lava was moving toward the city but everyone around me seemed calm.",
    mood: "Nervous",
    summary: "An eruption may symbolize powerful emotions or tension that has been building beneath the surface.",
    themes: %w[anger tension change],
    symbols: %w[volcano lava city]
  },
  {
    title: "Walking on Stars",
    input: "I was walking across the night sky by stepping from star to star. The earth looked tiny underneath me.",
    mood: "Joyful",
    summary: "Walking among stars may represent imagination, aspiration, and freedom from ordinary limitations.",
    themes: %w[freedom ambition wonder],
    symbols: %w[stars earth sky]
  },
  {
    title: "The Lost Phone",
    input: "I kept trying to call someone but my phone disappeared every time I picked it up.",
    mood: "Frustrated",
    summary: "Difficulty using a phone may symbolize communication problems or fear of losing connection.",
    themes: %w[communication frustration connection],
    symbols: %w[phone hands voice]
  },
  {
    title: "Glass House",
    input: "I lived in a house made entirely of glass. Everyone outside could see me but I couldn't see them.",
    mood: "Exposed",
    summary: "A glass home may symbolize vulnerability, visibility, and concern about how others perceive you.",
    themes: %w[vulnerability privacy judgment],
    symbols: %w[glass house windows]
  },
  {
    title: "The Green Snake",
    input: "A green snake was curled around my arm. I was afraid at first but it never tried to bite me.",
    mood: "Cautious",
    summary: "A calm snake may represent transformation, instinct, or something feared that may not actually be dangerous.",
    themes: %w[change instinct trust],
    symbols: %w[snake arm green]
  },
  {
    title: "Forgotten Exam",
    input: "I suddenly realized I had an exam that I had completely forgotten to study for. I couldn't even find the classroom.",
    mood: "Panicked",
    summary: "An unprepared exam often reflects performance anxiety, pressure, or fear of being judged.",
    themes: %w[pressure anxiety judgment],
    symbols: %w[exam school classroom]
  },
  {
    title: "The Lighthouse",
    input: "I was alone inside a lighthouse during a huge storm. I kept the light running while waves hit the windows.",
    mood: "Determined",
    summary: "Maintaining a lighthouse during a storm may symbolize resilience and remaining focused during emotional turbulence.",
    themes: %w[resilience guidance struggle],
    symbols: %w[lighthouse storm waves light]
  },
  {
    title: "Red Moon",
    input: "There was an enormous red moon filling almost the entire sky. Everyone was outside staring at it silently.",
    mood: "Awed",
    summary: "An unusually large moon may symbolize heightened emotions, intuition, or awareness of change.",
    themes: %w[emotion intuition change],
    symbols: %w[moon sky red]
  },
  {
    title: "The Empty Airport",
    input: "I arrived at an airport but it was completely empty. All the departure screens showed destinations I had never heard of.",
    mood: "Confused",
    summary: "An empty airport may represent transition and uncertainty about where your life is heading.",
    themes: %w[transition uncertainty choice],
    symbols: %w[airport screens airplane]
  },
  {
    title: "Growing Wings",
    input: "Wings suddenly grew from my back. At first they were painful, but then I learned how to use them.",
    mood: "Powerful",
    summary: "Growing wings may symbolize personal transformation, independence, and discovering new abilities.",
    themes: %w[growth freedom transformation],
    symbols: %w[wings sky body]
  },
  {
    title: "Flooded Library",
    input: "I entered a huge library where water was slowly rising. I was trying to save as many books as possible.",
    mood: "Worried",
    summary: "Trying to protect books from water may represent preserving knowledge or memories during emotional change.",
    themes: %w[memory knowledge emotion],
    symbols: %w[library books water]
  },
  {
    title: "Faceless Friend",
    input: "I was talking to my best friend but they had no face. I still knew exactly who they were.",
    mood: "Uncomfortable",
    summary: "A faceless familiar person may reflect uncertainty about a relationship or how you currently perceive someone.",
    themes: %w[identity connection uncertainty],
    symbols: %w[face friend voice]
  },
  {
    title: "Clock Running Backward",
    input: "Every clock around me started running backward. As time reversed, I became younger.",
    mood: "Nostalgic",
    summary: "Reversed time may symbolize nostalgia, regret, or a desire to revisit an earlier stage of life.",
    themes: %w[time memory regret],
    symbols: %w[clock time childhood]
  },
  {
    title: "The Blue Fire",
    input: "I held a blue flame in my hands. It wasn't hot and I could shape it into different objects.",
    mood: "Fascinated",
    summary: "Controlling harmless fire may symbolize creativity, personal power, and emotional energy.",
    themes: %w[creativity power control],
    symbols: %w[fire hands blue]
  },
  {
    title: "Maze of Hedges",
    input: "I was trapped in a huge hedge maze. Every path looked familiar but always led me back to the same fountain.",
    mood: "Frustrated",
    summary: "A repeating maze may reflect feeling stuck in a problem or repeating the same patterns.",
    themes: %w[confusion repetition frustration],
    symbols: %w[maze hedges fountain]
  },
  {
    title: "Floating Bed",
    input: "My bed floated out of my bedroom window and carried me above the city while I was still under the blankets.",
    mood: "Relaxed",
    summary: "Floating safely from bed may symbolize escapism, imagination, and a desire for effortless freedom.",
    themes: %w[escape freedom comfort],
    symbols: %w[bed window city sky]
  },
  {
    title: "The Giant Tree",
    input: "I found a tree so enormous that its branches disappeared into the clouds. I started climbing it.",
    mood: "Inspired",
    summary: "A giant tree may symbolize growth, ambition, stability, and connection between different parts of life.",
    themes: %w[growth ambition strength],
    symbols: %w[tree branches clouds]
  },
  {
    title: "No Reflection",
    input: "I looked into several mirrors but none of them showed my reflection. Everyone else's reflection appeared normally.",
    mood: "Disturbed",
    summary: "Having no reflection may symbolize uncertainty about identity, self-image, or your place among others.",
    themes: %w[identity insecurity isolation],
    symbols: %w[mirror reflection face]
  },
  {
    title: "Golden Key",
    input: "I found a golden key buried in the ground. I spent the entire dream looking for the door it belonged to.",
    mood: "Curious",
    summary: "Finding a key without its lock may symbolize discovering potential before understanding how to use it.",
    themes: %w[discovery potential mystery],
    symbols: %w[key gold door]
  },
  {
    title: "Endless Dinner",
    input: "I was at a huge dinner table with people I knew from completely different periods of my life.",
    mood: "Happy",
    summary: "Gathering people from different periods may represent integrating memories, relationships, and past identities.",
    themes: %w[connection memory belonging],
    symbols: %w[table food friends]
  },
  {
    title: "Snow in Summer",
    input: "It started snowing heavily on a hot summer day. Nobody else seemed to think it was strange.",
    mood: "Confused",
    summary: "Unexpected weather may represent conflicting emotions or circumstances that challenge expectations.",
    themes: %w[confusion contrast change],
    symbols: %w[snow summer sun]
  },
  {
    title: "The Silent Concert",
    input: "I was at a concert with thousands of people, but when the band played there was absolutely no sound.",
    mood: "Confused",
    summary: "A silent concert may symbolize difficulty expressing yourself or feeling disconnected despite being surrounded by others.",
    themes: %w[communication isolation expression],
    symbols: %w[concert music crowd]
  },
  {
    title: "Sunrise Twice",
    input: "I watched the sun rise, then suddenly the sky became dark and the sun rose a second time.",
    mood: "Hopeful",
    summary: "Repeated sunrise may symbolize renewal, second chances, and optimism about beginning again.",
    themes: %w[hope renewal opportunity],
    symbols: %w[sun sunrise sky]
  }
]

dreams.each_with_index do |dream_data, index|
  Dream.create!(
    user: user,
    date: Date.current - index.days,
    input: dream_data[:input],
    mood: dream_data[:mood],
    title: dream_data[:title],
    interpretation: {
      dream_title: dream_data[:title],
      summary: dream_data[:summary],
      dream_themes: dream_data[:themes],
      dream_symbols: dream_data[:symbols]
    }
  )
end

puts "Created #{Dream.count} dreams!"
