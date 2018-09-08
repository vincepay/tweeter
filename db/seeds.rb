# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
n=10

# Since id's can't be 0, I have added a 1 to iteration number
n.times do |i|
  user = User.create(
    email:"user#{i+1}@email.com",
    password: "password"
  )

  bio = Bio.create(
    profile_image:"https://robohash.org/#{user.email}.png",
    description: "This is bio description for user#{i+1}",
    user_id: user.id
  )

  (2*5).times do |j|
    post = Post.create(
      content: "This is the post no.#{j+1} of user#{i+1}",
      user_id: user.id
    )

    (3*n).times do |k|
      Comment.create(
        message: "This is message no.#{k+1} on the post no.#{j+1} of user#{i+1}",
        post_id: post.id,
        user_id: n-i
      )
    end

  end
end