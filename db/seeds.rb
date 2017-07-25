require "open-uri"
puts "SEEDING..."
PlayedInstrument.destroy_all
User.destroy_all

# COMMENT THESE LINES AFTER ONE SEED
# Instrument.destroy_all
# url = 'https://www.imit.org.uk/pages/a-to-z-of-musical-instrument.html'
# html_file = open(url)
# html_doc = Nokogiri::HTML(html_file)
# puts "SEEDING INSTRUMENTS..."
# instruments = []

# html_doc.search('table > tbody > tr > td:nth-child(1)').each do |element|

#   instruments << element.text.match(/\A[a-zA-Z\s\'\"\’]*/)[0]
# end

# instruments.each do |instrument|
#   Instrument.create(name: instrument.capitalize)
# end

# Instrument.find_by(name: "Instrument ").destroy
# Instrument.find_by(name: "T").destroy

# < ------------------------------------------------------------------- UP TO HERE --->
i = 0
profiles_pic = %w(http://lorempixel.com/400/400/people/1/ http://lorempixel.com/400/400/people/2/ http://lorempixel.com/400/400/people/3/ http://lorempixel.com/400/400/people/4/ http://lorempixel.com/400/400/people/5/ http://lorempixel.com/400/400/people/6/ http://lorempixel.com/400/400/people/7/ http://lorempixel.com/400/400/people/8/ http://lorempixel.com/400/400/people/9/ http://lorempixel.com/400/400/people/10/)


10.times do
  user = User.new(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name,email: Faker::Internet.email, password: Faker::Internet.password, description: Faker::Lorem.paragraph, birth_date: Faker::Date.birthday(18, 65), photo_url: profiles_pic[i])
    birthday = user.birth_date
    now = Date.today
    user.age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  user.save
  i+=1
  rand(1..5).times do
    PlayedInstrument.create(level: rand(1..5), instrument_id: rand(Instrument.first.id..Instrument.last.id), user: user)
  end
end


admin = User.create(first_name: 'Pika', last_name: 'Chu',email: 'pikachu@pokemail.net', password: 'pikapika', location: 'Downtown, Montreal', photo_url: 'app/assets/images/pika.jpg')

3.times do
  PlayedInstrument.create(level: rand(1..5), instrument_id: rand(Instrument.first.id..Instrument.last.id), user: User.find_by(first_name: "Pika"))
end

puts "done seeding !"
