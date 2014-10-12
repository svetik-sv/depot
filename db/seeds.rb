# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Order.delete_all
User.delete_all

Product.create!(title: 'зеленый чай', description: 'оч вкусный зеленый чай',
               image_url: 'chay.jpg', price: 100)
Product.create!(title: 'черный чай', description: 'китайский черный чай',
               image_url: 'chay1.jpg', price: 120)

100.times do |i|
  Order.create(name: "Заказчик #{i}", address: "Красноярск улица #{i}",
                email: "customer-#{i}@email.ru", pay_type: "чек")
end

User.create(name: "sveta", password: "123456")
