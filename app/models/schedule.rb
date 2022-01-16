class Schedule < ApplicationRecord
  belongs_to :employee
  has_one :attendance_request
  has_one :absence_request
end
