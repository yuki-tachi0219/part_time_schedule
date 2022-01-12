class AttendanceRequestNotification < ApplicationRecord
  belongs_to :attendance_request
  belongs_to :notification
end
