# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

john = User.create!(email: 'john@sample.com', password: 'password')
emily = User.create!(email: 'emily@sample.com', password: 'password')

1.times do
  john_board = john.boards.create!(
    name: Faker::Lorem.sentence(word_count: 1),
    description: Faker::Lorem.sentence(word_count: 20)
  )

  john_board.tasks.create!(
    title: Faker::Lorem.sentence(word_count: 2),
    content: Faker::Lorem.sentence(word_count: 10),
    creator: john,
    deadline: Date.today + 2.weeks
  )
end

1.times do
  emily_board = emily.boards.create!(
    name: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 20)
  )

  emily_board.tasks.create!(
    title: Faker::Lorem.sentence(word_count: 2),
    content: Faker::Lorem.sentence(word_count: 10),
    creator: emily,
    deadline: Date.today + 2.weeks
  )

end
