Factory.define :user do |user|
  user.name                  "Lance Velasco"
  user.email                 "lance@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end