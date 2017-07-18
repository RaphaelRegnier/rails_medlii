require "open-uri"


Instrument.destroy_all
PlayedInstrument.destroy_all
User.destroy_all

url = 'https://www.imit.org.uk/pages/a-to-z-of-musical-instrument.html'
html_file = open(url)
html_doc = Nokogiri::HTML(html_file)

instruments = []


html_doc.search('table > tbody > tr > td:nth-child(1)').each do |element|

instruments << element.text.match(/\A[a-zA-Z\s\/\'\"\’]*/)[0]
end

p instruments



