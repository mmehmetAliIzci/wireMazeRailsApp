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

10.times do
  description = Faker::Lorem.sentence(5)
  title = Faker::Lorem.sentence(3)
  salary = "1000-1500"
  type_of_contract = "Part-Time"
  profession_id = "1"
  user_id = "1"
  Job.create!(
    description: description,
    title: title,
    valid_from: Time.zone.now,
    valid_to: Time.zone.now + 15.day,
    type_of_contract: type_of_contract,
    salary: salary,
    profession_id: profession_id,
    active: true,
    created_at: Time.zone.now,
    updated_at: Time.zone.now,
    user_id: user_id
    )

end