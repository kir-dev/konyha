# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating kitchens 3 to 18'
16.times do |t|
  Kitchen.create(floor: t+3 )
end


min_appliance_per_kitchen = 2
max_appliance_per_kitchen = 10

min_comment_per_appliance = 3
max_comment_per_appliance = 20

Kitchen.all.each do |kitchen|
  Faker::Number.between(from: min_appliance_per_kitchen , to: max_appliance_per_kitchen).times do |num|
    appliance = Appliance.create(name: "#{Faker::Appliance.brand} #{Faker::Appliance.equipment}",
                                 category: Appliance.categories.values.sample,
                                 status: Appliance.statuses.values.sample,
                                 description: Faker::Lorem.sentence,
                                 kitchen: kitchen)
    num_comment = Faker::Number.between(from: min_comment_per_appliance, to: max_comment_per_appliance)
    num_comment.times do |t|
      ApplianceComment.create(body: Faker::Quote.famous_last_words,
                              category: ApplianceComment.categories.values.sample,
                              appliance: appliance)
    end
    puts "  Added #{num_comment} comment to appliance: #{appliance.name} at floor #{kitchen.floor}"

  end
end

