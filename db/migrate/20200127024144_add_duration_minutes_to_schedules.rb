class AddDurationMinutesToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :duration_minutes, :integer
  end
end
