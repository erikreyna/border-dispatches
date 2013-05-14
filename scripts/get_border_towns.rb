require 'geocoder'

# http://en.wikipedia.org/wiki/List_of_Mexico%E2%80%93United_States_border_crossings
# TODO: Get names of all towns.  Append state (either US or Mexico)

us_towns = [
  'San Ysidro, San Diego, California', 
  'Otay Mesa, San Diego, California',
  'Tecate, California',
  'Calexico, California',
  'Andrade, California',
  'San Luis, Arizona',
  'Lukeville, Arizona',
  'Sasabe, Arizona',
  'Nogales, Arizona',
  'Naco, Arizona',
  'Douglas, Arizona',
  'Antelope Wells, New Mexico',
  'Columbus, New Mexico',
  'Santa Teresa, New Mexico',
  'El Paso, Texas',
  'Fabens, Texas',
  'Fort Hancock, Texas',
  'Presidio, Texas',
  'Del Rio, Texas',
  'Eagle Pass, Texas',
  'Laredo, Texas',
  'Falcon Heights, Texas',
  'Roma, Texas',
  'Rio Grande City, Texas',
  'Los Ebanos, Texas',
  'Mission, Texas',
  'Hidalgo, Texas',
  'Pharr, Texas',
  'Donna, Texas',
  'Progreso, Texas',
  'Los Indios, Texas',
  'Brownsville, Texas'
]

mexico_towns = [
  'Tijuana, Baja California',
  'Mexicali, Baja California',
  'Los Algodones, Baja California',
  'San Luis Rio Colorado, Sonora',
  'Sonoyta, Sonora',
  'El Sasabe, Sonora',
  'Nogales, Sonora',
  'Naco, Sonora',
  'Agua Prieta, Sonora',
  'El Berrendo, Chihuahua',
  'Puerto Palomas, Chihuahua',
  'San Jeronimo, Chihuahua',
  'Ciudad Juarez, Chihuahua',
  'Caseta, Chihuahua',
  'El Porvenir, Chihuahua',
  'Ojinaga, Chihuahua',
  'Ciudad Acuna, Coahuila',
  'Piedras Negras, Coahuila',
  'Colombia, Nuevo Leon',
  'Nuevo Laredo, Tamaulipas',
  'Nueva Ciudad Guerrero, Tamaulipas',
  'Ciudad Miguel Aleman, Tamaulipas',
  'Ciudad Camargo, Tamaulipas',
  'Gustavo Diaz Ordaz, Tamaulipas',
  'Reynosa, Tamaulipas',
  'Rio Bravo, Tamaulipas',
  'Nuevo Progreso, Rio Bravo, Tamaulipas',
  'Matamoros, Tamaulipas'
]

puts "City,Latitude,Longitude\n"

mexico_towns.each do |town|
  s = Geocoder.search(town)
  puts "#{town.gsub!(',', '')},#{s[0].latitude},#{s[0].longitude}\n"
  sleep 2
end