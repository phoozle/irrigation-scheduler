class Schedule < ApplicationRecord
  belongs_to :zone

  validates :days, presence: true
  validates :times, presence: true
  validates :temperature_threshold, presence: true
  validates :duration_minutes, presence: true
end
