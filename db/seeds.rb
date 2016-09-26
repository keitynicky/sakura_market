
10.times do |n|
  Product.create!(name: 'name' + n.to_s, price: 100 + n, sort: 0 + n, is_hidden: false, photo: File.open(File.join(Rails.root, "/test/fixtures/files/image.png")))
end