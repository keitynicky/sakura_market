class ActiveSupport::TimeWithZone
  def normal_display
    unless self.nil?
      self.strftime("%Y年%m月%d日 %H:%M:%S")
    end
  end
end