module CheckOutsHelper
  def get_progress_info current_process
    ProgressInfo.new(current_process)     
  end
  
  class ProgressInfo < Struct.new :current_process
    
    def one_class
      get_color_class current_process >= 1
    end

    def two_class
      get_color_class current_process >= 2
    end

    def three_class
      get_color_class current_process >= 3
    end

    def progress_width
        width_percent = (30 * current_process) + 10
        "width: #{width_percent}%"
    end

  private

    def get_color_class is_primary
      is_primary ? "primary-color" : "no-color"
    end
  end

end
