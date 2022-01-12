class Administrator < ApplicationRecord
  belongs_to :store

  has_many :absence_requests
  has_many :attendance_requests
end
