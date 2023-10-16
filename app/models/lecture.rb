class Lecture < ApplicationRecord
  validates :duration, numericality: { greater_than: 0 }
end
