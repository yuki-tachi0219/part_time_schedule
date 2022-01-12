class AttendanceRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :administrator

  has_many :attendance_request_notifications
end
