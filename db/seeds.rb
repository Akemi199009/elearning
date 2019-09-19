require 'faker' 

User.create!(
  name: "Admin",
  email: "framgia@email.com",
  password: "password",
  admin: true
)

50.times do |n|
 User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.unique.email,
  password: "password"
 )
end



 #Following relationships
 users = User.all
 user = User.first
 following = users[2..40]
 followers = users[3..40]
 following.each { |followed| user.follow(followed)}
 followers.each { |follower| follower.follow(user)}
 