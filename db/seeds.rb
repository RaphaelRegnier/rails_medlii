require "open-uri"
puts "SEEDING..."
PlayedInstrument.destroy_all
User.destroy_all
Instrument.destroy_all

puts "SEEDING INSTRUMENTS..."
instruments = ['electric guitar', 'keyboard', 'piano', 'drums', 'saxophone', 'bass guitar', 'acoustic guitar', 'classical guitar', 'violin', 'flute', 'trumpet', 'clarinet', 'cello', 'voice', 'synthetiser', 'ukulele', 'harp', 'xylophone', 'harmonica', 'viola', 'bass', 'bassoon', 'piccolo']

instruments.each do |instrument|
  Instrument.create(name: instrument.capitalize)
end

profile_pics = ["https://www.telegraphindia.com/1160622/images/22bass(1).jpg",
  "https://dc95wa4w5yhv.cloudfront.net/image-cache/feast-of-trumpets_833_460_80_c1.jpg",
  "http://www.andysmusic.com/photos/Roland-Juno-Di-3.jpg",
  "http://joshuabell.com/wp-content/uploads/2016/08/DSC_4334-1600x1128.jpg",
  "http://theartsdesk.com/sites/default/files/images/stories/CLASSICAL/adam_sweeting/Milos%20DG%20pic%20%5Bmiami%5D%20TRIM.jpg",
  "https://c.o0bg.com/rf/image_960w/Boston/2011-2020/2013/01/18/BostonGlobe.com/Arts/Images/1319-Ambrose_Akinmusire-credit-ClayPatrickMcBride2.jpg",
  "http://chicagoclassicalreview.com/wp-content/uploads/Roman_13.jpg",
  "https://cdn.bandmix.com/bandmix_us/media/313/313130/414355-l.jpg",
  "http://2.bp.blogspot.com/-BMvppPaoVtw/Tai6qFvWBqI/AAAAAAAAAKo/SA17YLxPtoo/s1600/41159_112232978833311_100001398277867_91208_7140261_n.jpg",
  "https://princewilliamliving.com/wp-content/uploads/2014/02/Ziebart.jpg",
  "http://images.huffingtonpost.com/2016-01-25-1453713225-1879316-anitaBalanz_archiva_nacional_hr.jpg"]

songs = %w(https://open.spotify.com/track/0P0YHs0fjvYiTcLgTjaCOG https://open.spotify.com/track/2eLQzjfkfh7o88PW4BrtXx https://open.spotify.com/track/7KaROZFIMjrs42DYa09lqb https://open.spotify.com/track/7iGihxJtonRihMflgIbj13 https://open.spotify.com/track/0FE9t6xYkqWXU2ahLh6D8X https://open.spotify.com/track/66qlqxhEMpSHOzjRK4il0b https://open.spotify.com/track/7q4HeVYqt1XNOEaTpuQdB3 https://open.spotify.com/track/69RoAhDqFOiQb2pQvb24Ii https://open.spotify.com/track/4CwHxHsM3gN60eZY1dto3G https://open.spotify.com/track/6dGnYIeXmHdcikdzNNDMm2 https://open.spotify.com/track/2TiVvOB4o9IWSlgEUIJXc8 https://open.spotify.com/track/14Yt3KfCCbtpgUkKPgKJMc https://open.spotify.com/track/3DNRdudZ2SstnDCVKFdXxG https://open.spotify.com/track/68vgtRHr7iZHpzGpon6Jlo https://open.spotify.com/track/3dhjNA0jGA8vHBQ1VdD6vV https://open.spotify.com/track/6LJFgCd9wU2VptHEwz2Wl3)
addresses = ["1234 Drummond Street, Montreal, QC, Canada", "1000 de la commune, Montréal, QC, Canada", "3879 Wellington Street, Verdun, QC, Canada", "3879 Ontario Street East, Montreal, QC, Canada", "2300 Boul. du Tricentenaire, Montréal, QC, Canada", "4654 Rue Saint-Urbain, Montreal, QC, Canada", "4500 Ch. de la Côte-des-Neiges, Westmount, QC, Canada", "1112 Crolssant Verdon Laval, QC, Canada", "4430 Rue Saint-Antoine Ouest, Montreal, QC, Canada", "5930 Montreal Road Ottawa, ON, Canada"]
first_names = ["Natalie", "Dustin", "Sarah", "Jean", "Dan", "Jack", "Teo", "Melanie", "Nicole", "Sonia" ]
last_names = ["Gatien", "Campbell", "Melanson", "Robichaud", "Brown", "Nicholson", "Kerr", "Appolinary", "Lee", "Carpenter"]

serene = User.new(first_name: "Serene", last_name: "Gomez", email: "serenegomez@gmail.com", password: "pikapika", description: "Hi ! I've been looking for a partner to try cool music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !", birth_date: Faker::Date.birthday(21, 30), location: addresses[3], song: songs[1], photo_url: "https://farm5.static.flickr.com/4228/34934825612_f87e358096_b.jpg")
 birthday = serene.birth_date
    now = Date.today
    serene.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  serene.save
PlayedInstrument.create(user: serene, instrument_id: Instrument.find_by(name: "Cello").id, level: 4)
PlayedInstrument.create(user: serene, instrument_id: Instrument.find_by(name: "Voice").id, level: 3)


natalie = User.new(first_name: first_names[0], last_name: last_names[0], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[0], song: songs[0],
  photo_url: profile_pics[0])
 birthday = natalie.birth_date
    now = Date.today
    natalie.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  serene.save
PlayedInstrument.create(user: natalie, instrument_id: Instrument.find_by(name: "Cello").id, level: 4)
PlayedInstrument.create(user: natalie, instrument_id: Instrument.find_by(name: "Violin").id, level: 4)
PlayedInstrument.create(user: natalie, instrument_id: Instrument.find_by(name: "Piano").id, level: 3)


dustin = User.new(first_name: first_names[1], last_name: last_names[1], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[1], song: songs[1],
  photo_url: profile_pics[1])
 birthday = dustin.birth_date
    now = Date.today
    dustin.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  dustin.save
PlayedInstrument.create(user: dustin, instrument_id: Instrument.find_by(name: "Trumpet").id, level: 5)
PlayedInstrument.create(user: dustin, instrument_id: Instrument.find_by(name: "Clarinet").id, level: 2)


sarah = User.new(first_name: first_names[2], last_name: last_names[2], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[2], song: songs[2],
  photo_url: profile_pics[2])
 birthday = sarah.birth_date
    now = Date.today
    sarah.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  sarah.save
PlayedInstrument.create(user: sarah, instrument_id: Instrument.find_by(name: "Keyboard").id, level: 3)
PlayedInstrument.create(user: sarah, instrument_id: Instrument.find_by(name: "Drums").id, level: 3)


jean = User.new(first_name: first_names[3], last_name: last_names[3], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[3], song: songs[3],
  photo_url: profile_pics[3])
 birthday = jean.birth_date
    now = Date.today
    jean.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  jean.save
PlayedInstrument.create(user: jean, instrument_id: Instrument.find_by(name: "Violin").id, level: 5)


dan = User.new(first_name: first_names[4], last_name: last_names[4], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[4], song: songs[4],
  photo_url: profile_pics[4])
 birthday = dan.birth_date
    now = Date.today
    dan.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  dan.save
PlayedInstrument.create(user: dan, instrument_id: Instrument.find_by(name: "Classical guitar").id, level: 3)
PlayedInstrument.create(user: dan, instrument_id: Instrument.find_by(name: "Acoustic guitar").id, level: 3)


jack = User.new(first_name: first_names[6], last_name: last_names[6], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[6], song: songs[6],
  photo_url: profile_pics[6])
 birthday = jack.birth_date
    now = Date.today
    jack.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  jack.save
PlayedInstrument.create(user: jack, instrument_id: Instrument.find_by(name: "Cello").id, level: 4)
PlayedInstrument.create(user: jack, instrument_id: Instrument.find_by(name: "Voice").id, level: 4)
PlayedInstrument.create(user: jack, instrument_id: Instrument.find_by(name: "Bass").id, level: 3)


teo = User.new(first_name: first_names[5], last_name: last_names[5], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool5 music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[5], song: songs[5],
  photo_url: profile_pics[5])
 birthday = teo.birth_date
    now = Date.today
    teo.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  teo.save
PlayedInstrument.create(user: teo, instrument_id: Instrument.find_by(name: "Trumpet").id, level: 4)
PlayedInstrument.create(user: teo, instrument_id: Instrument.find_by(name: "Harmonica").id, level: 5)

melanie = User.new(first_name: first_names[7], last_name: last_names[7], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool5 music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[7], song: songs[7],
  photo_url: profile_pics[7])
 birthday = melanie.birth_date
    now = Date.today
    melanie.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  melanie.save
PlayedInstrument.create(user: melanie, instrument_id: Instrument.find_by(name: "Saxophone").id, level: 5)
PlayedInstrument.create(user: melanie, instrument_id: Instrument.find_by(name: "Piano").id, level: 5)


nicole = User.new(first_name: first_names[8], last_name: last_names[8], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool5 music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[8], song: songs[8],
  photo_url: profile_pics[8])
 birthday = nicole.birth_date
    now = Date.today
    nicole.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  nicole.save
PlayedInstrument.create(user: nicole, instrument_id: Instrument.find_by(name: "Piano").id, level: 5)
PlayedInstrument.create(user: nicole, instrument_id: Instrument.find_by(name: "Synthetiser").id, level: 3)
PlayedInstrument.create(user: nicole, instrument_id: Instrument.find_by(name: "Cello").id, level: 4)


sonia = User.new(first_name: first_names[9], last_name: last_names[9], email: Faker::Internet.email, password: Faker::Internet.password,
  description: "Hi ! I've been looking for a partner to try cool5 music stuff, I'd like to try songs out of the classical registry with my cello, so if you're a pop singer or something like that, let's play together !",
  birth_date: Faker::Date.birthday(18, 40), location: addresses[9], song: songs[9],
  photo_url: profile_pics[9])
 birthday = sonia.birth_date
    now = Date.today
    sonia.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  sonia.save
PlayedInstrument.create(user: sonia, instrument_id: Instrument.find_by(name: "Flute").id, level: 3)
PlayedInstrument.create(user: sonia, instrument_id: Instrument.find_by(name: "Piccolo").id, level: 3)



puts "done seeding !"




# profile_pics = ["https://www.telegraphindia.com/1160622/images/22bass(1).jpg", "https://dc95wa4w5yhv.cloudfront.net/image-cache/feast-of-trumpets_833_460_80_c1.jpg",
#   "http://www.andysmusic.com/photos/Roland-Juno-Di-3.jpg", "http://joshuabell.com/wp-content/uploads/2016/08/DSC_4334-1600x1128.jpg",
#   "http://theartsdesk.com/sites/default/files/images/stories/CLASSICAL/adam_sweeting/Milos%20DG%20pic%20%5Bmiami%5D%20TRIM.jpg", "https://c.o0bg.com/rf/image_960w/Boston/2011-2020/2013/01/18/BostonGlobe.com/Arts/Images/1319-Ambrose_Akinmusire-credit-ClayPatrickMcBride2.jpg",
#    "http://chicagoclassicalreview.com/wp-content/uploads/Roman_13.jpg", "https://cdn.bandmix.com/bandmix_us/media/313/313130/414355-l.jpg",
#    "http://2.bp.blogspot.com/-BMvppPaoVtw/Tai6qFvWBqI/AAAAAAAAAKo/SA17YLxPtoo/s1600/41159_112232978833311_100001398277867_91208_7140261_n.jpg",
#    "https://princewilliamliving.com/wp-content/uploads/2014/02/Ziebart.jpg", "http://images.huffingtonpost.com/2016-01-25-1453713225-1879316-anitaBalanz_archiva_nacional_hr.jpg"]

