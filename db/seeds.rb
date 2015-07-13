# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#c
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
#   
Notice.create!(
    title: "Example title",
    date: Time.now.strftime("%d/%m/%Y"),
    summary: "Example summary",
    text: "Example Text",
    prior: true,
    active: true,
    created_at: Time.zone.now,
    updated_at: Time.zone.now)


notices = Notice.order(:created_at).take(6)
50.times do
  text = Faker::Lorem.sentence(5)
  summary = Faker::Lorem.sentence(3)
  title = Faker::Lorem.sentence(1)
  Notice.create!(
  	title: title,
  	date: Time.zone.now,
    summary: summary,
    text: text,
    prior: true,
    active: true,
    created_at: Time.zone.now,
    updated_at: Time.zone.now
    )

end