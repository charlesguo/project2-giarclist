require_relative "../app/models/category.rb"
require_relative "../app/models/listing.rb"
require_relative "../app/models/user.rb"

Category.destroy_all
Listing.destroy_all
# User.destroy_all

[
  {
    title: "Toys",
    description: "This is a general category for toys."
  },
  {
    title: "Food",
    description: "This is a general category for food."
  }
].each do |category|
  Category.create!(category)
end

[
  {
    title: "Transformers - Optimus Prime",
    description: "Best condition",
    price: 10.99,
    category_id: 1,
    user_id: 1
  },
  {
    title: "Korean Strawberries",
    description: "Fresh and Juicy",
    price: 6.00,
    category_id: 2,
    user_id: 1
  },
  {
    title: "Cookie Monster",
    description: "Sesame Street",
    price: 2.50,
    category_id: 2,
    user_id: 2
  },
  {
    title: "Granola Bar",
    description: "Healthy Eating",
    price: 24.00,
    category_id: 2,
    user_id: 2
  },
  {
    title: "Cabbage Patch Toys",
    description: "Doll",
    price: 4.50,
    category_id: 1,
    user_id: 2
  }
].each do |listing|
  Listing.create!(listing)
end

# [
#   { name: "HipHop" },
#   { name: "Rock" }
# ].each do |genre|
#   Genre.create!(genre)
# end
