# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


10.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "0123456789"
  ) 
end

images = ["https://i.pinimg.com/originals/65/7a/64/657a64ba46507056c1f1ff5250c73eca.jpg", "https://i.ytimg.com/vi/SQJrYw1QvSQ/maxresdefault.jpg", "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F47%2F2020%2F06%2F26%2Ftiny-white-kitten-873941684-2000.jpg", "https://image.winudf.com/v2/image/Y29tLmFuZHJvbW8uZGV2NDg2Mjc2LmFwcDQ0NzU3MF9zY3JlZW5zaG90c18xXzFmZTg5M2I5/screen-1.jpg?fakeurl=1&type=.jpg", "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80", "https://i2-prod.mirror.co.uk/incoming/article21142078.ece/ALTERNATES/s1200c/0_Stray-Cat.jpg", "https://www.rd.com/wp-content/uploads/2021/04/GettyImages-145679137-scaled-e1619025176434.jpg", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cute-photos-of-cats-cuddling-1593203046.jpg", "https://cdn.pixabay.com/photo/2020/06/23/18/11/cute-cat-5333325_1280.jpg", "https://www.rd.com/wp-content/uploads/2021/02/GettyImages-1208220393-e1612811442160.jpg", "https://i.pinimg.com/originals/95/33/05/953305a0efd9a15ea3b37d88d1bc768e.jpg", "https://suddenlycat.com/wp-content/uploads/2019/12/Cutest-Cat-SCB.jpg", "https://cf.shopee.com.my/file/9cd965218d7c3d124438ca8308fc655b", "https://64.media.tumblr.com/18e3164d94efbd247ba3423335d7ac14/tumblr_pjgctl3kzv1sok7a0o1_1280.jpg", "https://data.whicdn.com/images/302189501/original.jpg", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/cute-photos-of-cats-looking-at-camera-1593184780.jpg", "https://i.pinimg.com/originals/93/b8/2e/93b82e9e57c60cb9f95f33e5a7100c2f.jpg", "https://static.boredpanda.com/blog/wp-content/uploads/2019/03/BuMK3pbBQWB-png__700.jpg"]

images.each do |image|
  item = Item.create!(
    title: Faker::Creature::Cat.breed,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    price: Faker::Number.decimal(l_digits: 2),
  )
end

2.times do
  cart = Cart.create!(
    user_id: Faker::Number.within(range: 1..10)
  ) 
end

10.times do
  item_in_cart = ItemsInCart.create!(
    cart_id: Faker::Number.within(range: 1..2),
    item_id: Faker::Number.within(range: 1..18),
    order_id: Faker::Number.within(range: 1..5),
    quantity: 1
  ) 
end

# 5.times do
#   order = Order.create!(
#     name: Faker::Alphanumeric.alphanumeric(number: 10, min_alpha: 3, min_numeric: 3),
#     user_id: Faker::Number.within(range: 1..10),
#     cart_id: Faker::Number.within(range: 1..2)
#     #stripe_id
#   ) 
# end
