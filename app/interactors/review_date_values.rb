module ReviewDateValues
  extend self
  def call(period)
    values = { '1' => 12.hours, '2' => 3.days, '3' => 1.week, '4' => 2.weeks, '5' => 1.month }
    values[period]
  end
end
