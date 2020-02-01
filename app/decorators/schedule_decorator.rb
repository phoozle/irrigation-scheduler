class ScheduleDecorator < Draper::Decorator
  delegate_all

  def day_names
    object.days.map { |day| Date::DAYNAMES[day] }
  end

  def times_friendly
    object.times.map { |time| time.strftime("%I:%M%p") }
  end
end
