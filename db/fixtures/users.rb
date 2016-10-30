if User.where(email: 'admin@admin.com').size.zero?
  User.create(email: 'admin@admin.com', password: '123456', auth_type: 0)
end