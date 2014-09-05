# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


15.times do
  User.create(name: Faker::Name.name)
end

tf = [true, false]

u = User.all.sample
d = u.documents.create(
    title: 'David Bowie',
    context: 'thinking about bowie',
    privacy: tf.sample
  )

d.versions.create(content: "Bowie studied art, music and design, including layout and typesetting. After Terry Burns, his half-brother, introduced him to modern jazz, his enthusiasm for players like Charles Mingus and John Coltrane led his mother to give him a plastic alto saxophone in 1961; he was soon receiving lessons from a local musician.[13] Bowie received a serious injury at school in 1962 when his friend George Underwood punched him in the left eye during a fight over a girl. Doctors feared he would become blind in that eye. After a series of operations during a four-month hospitalisation,[14] his doctors determined that the damage could not be fully repaired and Bowie was left with faulty depth perception and a permanently dilated pupil. Despite their altercation, Underwood and Bowie remained good friends, and Underwood went on to create the artwork for Bowie's early albums.")

v = User.all.sample
e = v.documents.create(
    title: 'John Coltrane',
    context: 'thinking about coltrane',
    privacy: tf.sample
  )
e.versions.create(content: "Coltrane formed his first group, a quartet, in 1960 for an appearance at the Jazz Gallery in New York City. After moving through different personnel including Steve Kuhn, Pete La Roca, and Billy Higgins, the lineup stabilized in the fall with pianist McCoy Tyner, bassist Steve Davis, and drummer Elvin Jones. Tyner, from Philadelphia, had been a friend of Coltrane's for some years and the two men had an understanding that the pianist would join Coltrane when Tyner felt ready for the exposure of regularly working with him. Also recorded in the same sessions[clarification needed] were the later released albums Coltrane's Sound and Coltrane Plays the Blues.")

w = User.all.sample
f = w.documents.create(
    title: 'Rashied Ali',
    context: 'thinking about ali',
    privacy: tf.sample
  )
f.versions.create(content: "In the last years of his life, Rashied Ali led his own eponymous quintet. A double CD entitled Judgment Day was recorded in February 2005 and features Jumaane Smith on trumpet, Lawrence Clark on tenor sax, Greg Murphy on piano and Joris Teepe on bass. This album was recorded at Ali's own Survival Studio, which has been in existence since the 1970s. In addition to his performance activities Ali served as mentor to numerous young drummers including Matt Smith.")

30.times do
  c = Version.all.sample.comments.create(body: Faker::Hacker.say_something_smart)
  User.all.sample.comments << c
end
