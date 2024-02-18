module MoviesHelper
    def sort_indicator_and_style(column)
      if sort_column == column
        if sort_direction == 'asc'
          arrow = '↑' # Unicode arrow symbol for ascending
          background_color = '#9999FF'
        else
          arrow = '↓' # Unicode arrow symbol for descending
          background_color = '#FF9999'
        end
        style = "background-color: #{background_color};" # Apply color style
      else
        arrow = ''
        style = ''
      end
      puts "Arrow: #{arrow}, Style: #{style}"
      return arrow, style
    end
  
    def sort_column
      session[:sort_column]
    end
  
    def sort_direction_class
      if sort_direction == 'asc'
        'ascending'
      elsif sort_direction == 'desc'
        'descending'
      else
        ''
      end
    end
  
    def sort_direction
      session[:sort_direction] || 'asc' # Default to ascending if not set
    end
  
    def sort_class(column)
      sort_column == column ? 'sorted' : ''
    end
  end
  