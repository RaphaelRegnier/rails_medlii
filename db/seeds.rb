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

i = 0
profiles_pic = %w(http://lorempixel.com/400/400/people/1/ http://lorempixel.com/400/400/people/2/ http://lorempixel.com/400/400/people/3/ http://lorempixel.com/400/400/people/4/ http://lorempixel.com/400/400/people/5/ http://lorempixel.com/400/400/people/6/ http://lorempixel.com/400/400/people/7/ http://lorempixel.com/400/400/people/8/ http://lorempixel.com/400/400/people/9/ http://lorempixel.com/400/400/people/10/)

addresses = ["6817 43 Av Montreal QC H1T 2R9", "7503 Rue St Denis Montreal QC H2R 2E7", "251 Av Percival Montreal Ouest QC H4X 1T8", "7766 George Street Lasalle QC H8P 1E1", "11727 Rue Notre Dame E Montreal QC H1B 2X8", "5745 17 Av Montreal QC H1X 2R7", "3708 Rue St Hubert Montreal QC H2L 4A2", "800 Rue Gagne Lasalle QC H8P 3W3", "4430 Ste Catherine Street O Westmount QC H3Z 3E4", "5930 Rue Hurteau Montreal QC H4E 2Y2"]

10.times do
  user = User.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name,email: Faker::Internet.email, password: Faker::Internet.password, description: Faker::Lorem.paragraph, birth_date: Faker::Date.birthday(18, 65), location: addresses[i], photo_url: profiles_pic[i])
    birthday = user.birth_date
    now = Date.today
    user.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  user.save
  i+=1
  rand(1..5).times do
    PlayedInstrument.create(level: rand(1..5), instrument_id: rand(Instrument.first.id..Instrument.last.id), user: user)
  end
end


admin = User.create(first_name: 'Pika', last_name: 'Chu',email: 'pikachu@pokemail.net', password: 'pikapika', location: '717 Charron Street Lasalle QC H8P 3T8', photo_url: 'app/assets/images/pika.jpg')

3.times do
  PlayedInstrument.create(level: rand(1..5), instrument_id: rand(Instrument.first.id..Instrument.last.id), user: User.find_by(first_name: "Pika"))
end

puts "done seeding !"
