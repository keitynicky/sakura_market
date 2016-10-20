module ApplicationHelper
  def disp_money(target)
    number_to_currency(target, format: '%u%n', unit: '￥', precision: 0)
  end

  def disp_number(target)
    number_with_delimiter(target, delimiter: ',')
  end
end
