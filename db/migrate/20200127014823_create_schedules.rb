class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :days, default: [], array: true
      t.time :times, default: [], array: true

      t.boolean :rain_skip, default: false
      t.integer :temperature_threshold, default: 0

      t.references :zone

      t.timestamps
    end
  end
end
