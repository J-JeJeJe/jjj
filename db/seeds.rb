# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "jjj@gmail.com",
             password:  "testjjj",
             password_confirmation: "testjjj",
             )
Product.create(image_id: File.open('./app/assets/images/cake.jpg') , title: 'ショートケーキ', description: '美味しい', price: '20000000')
Product.create(image_id: File.open('./app/assets/images/cake.jpg') , title: 'チョコケーキ', description: '美味しい', price: '20000000')
Product.create(image_id: File.open('./app/assets/images/cake.jpg') , title: 'チーズケーキ', description: '美味しい', price: '20000000')
Product.create(image_id: File.open('./app/assets/images/cake.jpg') , title: 'ケーキ', description: '美味しい', price: '20000000')
Product.create(image_id: File.open('./app/assets/images/cake.jpg') , title: 'パンケーキ', description: '美味しい', price: '20000000')
