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

addresses = ["1234 Drummond Street, Montreal, QC, Canada", "1000 de la commune, Montréal, QC, Canada", "3879 Wellington Street, Verdun, QC, Canada", "3879 Ontario Street East, Montreal, QC, Canada", "2300 Boul. du Tricentenaire, Montréal, QC, Canada", "4654 Rue Saint-Urbain, Montreal, QC, Canada", "4500 Ch. de la Côte-des-Neiges, Westmount, QC, Canada", "1112 Crolssant Verdon Laval, QC, Canada", "4430 Rue Saint-Antoine Ouest, Montreal, QC, Canada", "5930 Montreal Road Ottawa, ON, Canada"]

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
