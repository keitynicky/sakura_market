module ApplicationHelper
  def disp_money(target)
    number_to_currency(target, format: '%u%n', unit: '￥', precision: 0)
  end

  def disp_number(target)
    number_with_delimiter(target, delimiter: ',')
  end

  def disp_normal_date(target)
    unless target.nil?
      target.strftime("%Y年%m月%d日 %H:%M:%S")
    end
  end
end
