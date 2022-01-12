class Employee < ApplicationRecord
  belongs_to :store

  has_many :schedules
end
