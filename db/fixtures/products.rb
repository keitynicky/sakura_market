READ_BINARY = "rb"

if Product.all.size.zero?
  10.times do |n|
    Product.seed do |s|
      s.name = 'name' + n.to_s 
      s.description = 'description' + n.to_s 
      s.price = 100 + n 
      s.sort = n 
      s.is_hidden = false
      path = Rails.root.join("db/fixtures/images/image.png")
      s.photo = File.open(path, READ_BINARY).read
    end
  end
end