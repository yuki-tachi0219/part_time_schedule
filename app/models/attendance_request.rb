class AttendanceRequest < ApplicationRecord
  belongs_to :schedule
  has_many :attendance_request_notifications
end
