class Calendar
  def initialize
    @year = 1
    @month = 1
    @day = 1
  end

  def year
    @year
  end

  def month
    @month
  end

  def day
    @day
  end

  def pass pass_day
    if pass_day > 0
      @day += pass_day
      while @day > 30
        @month += 1
        @day -= 30
        if @month >= 10
          @month -= 10
          @year += 1
        end
      end
    end
  end
end
