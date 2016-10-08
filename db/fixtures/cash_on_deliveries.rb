  CashOnDelivery.destroy_all
  
  MAX_FEE_1 = 10000
  MAX_FEE_2 = 30000
  MAX_FEE_3 = 100000
  MAX_FEE_4 = 2147483647

  CashOnDelivery.seed do |s|
    s.min_fee = 0 
    s.max_fee = MAX_FEE_1 - 1 
    s.cost = 300 
  end

  CashOnDelivery.seed do |s|
    s.min_fee = MAX_FEE_1
    s.max_fee = MAX_FEE_2 - 1 
    s.cost = 400 
  end

  CashOnDelivery.seed do |s|
    s.min_fee = MAX_FEE_2
    s.max_fee = MAX_FEE_3 - 1
    s.cost = 600 
  end

  CashOnDelivery.seed do |s|
    s.min_fee = MAX_FEE_3
    s.max_fee = MAX_FEE_4
    s.cost = 1000 
  end