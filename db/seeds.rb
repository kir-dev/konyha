# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

18.times do |t|
  Kitchen.create(floor: t)
end

basic_applaince = ['sütő', 'mikró']

Kitchen.all.each do |kitchen|
  basic_applaince.each do |appliance|
    Appliance.create(name: appliance,
                     category: Appliance.categories.values.sample,
                     status: Appliance.statuses.values.sample,
                     description:"Ez egy eszköz leírása.",
                     kitchen: kitchen)
  end
end

10.times do |t|
  ApplianceComment.create(body:      'Kommnet teste',
                          category:  ApplianceComment.categories.values.sample,
                          appliance: Appliance.all.sample)
end
