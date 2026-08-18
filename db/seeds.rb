user = User.first_or_create!(
  email: "test@mail.com",
  password: "secret"
)

dreams = [
  {
    title: "The Melting Face",
    date: Date.today - 1,
    input: "I looked into a mirror and my face slowly started melting. I tried to touch it, but my hands passed through my reflection.",
    mood: "Scared"
  },
  {
    title: "Flying Over Tokyo",
    date: Date.today - 2,
    input: "I was flying above a huge city at night. I could see all the lights below me and felt completely free.",
    mood: "Happy"
  },
  {
    title: "The Endless Hallway",
    date: Date.today - 3,
    input: "I was walking through a hallway with hundreds of doors. Every time I opened one, there was another hallway behind it.",
    mood: "Confused"
  },
  {
    title: "Teeth Falling Out",
    date: Date.today - 4,
    input: "I was talking to someone when my teeth suddenly started falling out one by one. I tried to hide it from everyone.",
    mood: "Embarrassed"
  },
  {
    title: "The Giant Wave",
    date: Date.today - 5,
    input: "I was standing on a beach when an enormous wave appeared. Everyone ran, but I just stood there watching it come toward me.",
    mood: "Overwhelmed"
  },
  {
    title: "Back at School",
    date: Date.today - 6,
    input: "I was back at school and suddenly realized I had an exam. I hadn't studied anything and couldn't even find the classroom.",
    mood: "Anxious"
  },
  {
    title: "The Talking Cat",
    date: Date.today - 7,
    input: "A black cat followed me home and started talking to me. It told me not to open the door to my apartment.",
    mood: "Curious"
  },
  {
    title: "Running but Going Nowhere",
    date: Date.today - 8,
    input: "Something was chasing me through a forest. I kept running as fast as possible, but I barely moved.",
    mood: "Terrified"
  },
  {
    title: "The Hidden Room",
    date: Date.today - 9,
    input: "I discovered a room in my house that I had never seen before. It was full of old photographs and objects I didn't recognize.",
    mood: "Curious"
  },
  {
    title: "Underwater City",
    date: Date.today - 10,
    input: "I was walking through a city completely underwater, but somehow I could breathe normally. Fish were swimming between the buildings.",
    mood: "Peaceful"
  },
  {
    title: "Missing the Train",
    date: Date.today - 11,
    input: "I was running through a station trying to catch a train. Every time I reached the platform, the train had just left.",
    mood: "Frustrated"
  },
  {
    title: "The Empty City",
    date: Date.today - 12,
    input: "I walked through a huge city in the middle of the day, but there wasn't a single person anywhere.",
    mood: "Lonely"
  },
  {
    title: "The Endless Staircase",
    date: Date.today - 13,
    input: "I was climbing a staircase inside a tower. I could see the top, but no matter how long I climbed, it never got closer.",
    mood: "Exhausted"
  },
  {
    title: "The Second Moon",
    date: Date.today - 14,
    input: "I looked at the night sky and saw two moons. Everyone around me acted like it was normal, but I knew something was wrong.",
    mood: "Uneasy"
  }
]

dreams.each do |dream|
  Dream.create!(
    **dream,
    user: user
  )
end

puts "Created #{Dream.count} dreams!"
