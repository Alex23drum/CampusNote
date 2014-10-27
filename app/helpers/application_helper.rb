module ApplicationHelper
  def japtime_for(time)
    time.strftime("%Y/%m/%d(#{%w(日 月 火 水 木 金 土)[time.wday]})")
  end
end
