class AttendanceRequest < ApplicationRecord
  belongs_to :schedule
  has_many :attendance_request_notifications
  enum state: { application: 0, approval: 1, rejection: 2 }
end
