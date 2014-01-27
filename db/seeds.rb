# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cias = Cia.create(
	[
		{nome: 'GOL', cod: 'G3' logo: 'v1390826607/jfjkp1pe8gmo5axjnvs6.png'},
		{nome: 'AZUL', cod: 'AD' logo: 'v1390826624/fir3framnytl4qfzwap6.png'}

	]
)
cias.save!