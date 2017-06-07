# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Product.destroy_all
# 40.times do 
#   Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price.to_s, description: Faker::StarWars.quote, quantity: Faker::Number.between(1, 9999), rating: Faker::Number.between(1,5), in_stock: true, supplier_id: Supplier.all.sample.id)
# end
# Image.all.each do |image|
#   count = 142
#   image.update(product_id: Product.all.count)

# end
# Image.destroy_all
# 2.times do 
#   Product.all.each do |product|
#     # product.update()
#     Image.create(product_id: product.id, url: "http://lorempixel.com/#{Faker::Number.between(600,700)}/#{Faker::Number.between(400,500)}")
#   end
# end
# 40.times do  /
# 120.times do
#   Image.create(url: "http://imgur.com/PwqHArq", product_id: Product.all.sample.id)
# end
# Image.all.each do |image|
#   image.update(product_id: Product.all.sample.id)
# end
Product.all.each do |product|
  CategorizedProduct.create(product_id: product.id, category_id: Category.pluck(:id).sample)
  CategorizedProduct.create(product_id: product.id, category_id: Category.pluck(:id).sample)
end

puts "Done!"