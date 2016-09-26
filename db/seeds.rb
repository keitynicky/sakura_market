
image_file = Fixture::file 'files/image.png'

10.times do |n|
  Product.create!(name: 'name' + n.to_s, price: 100 + n, sort: 0 + n, is_hidden: false, photo: image_file)
end