class Schedule < ApplicationRecord
  belongs_to :employee
  has_one :attendance_request, dependent: :destroy
  has_one :absence_request, dependent: :destroy
end
