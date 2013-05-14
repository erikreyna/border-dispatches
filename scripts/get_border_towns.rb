require 'geocoder'

# http://en.wikipedia.org/wiki/List_of_Mexico%E2%80%93United_States_border_crossings
# TODO: Get names of all towns.  Append state (either US or Mexico)

towns = [
  'San Ysidro, CA',
  'Tijuana, Baja California',
  'Otay Mesa, CA',
  'Boulevard Garita de Otay	Tijuana, Baja California',
  'Tecate, CA',
  'Tecate, Baja California',
  'Mexicali, Baja California',
  'Calexico West, CA',
  'Calexico East, CA',
  'Andrade, CA',
  'Los Algodones, Baja California'
]

puts "City,Latitude,Longitude\n"

towns.each do |town|
  s = Geocoder.search(town)
  puts "#{town.gsub!(',', '')},#{s[0].latitude},#{s[0].longitude}\n"
end