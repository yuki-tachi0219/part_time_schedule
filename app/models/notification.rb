class Notification < ApplicationRecord
  has_many :attendance_request_notifications
  has_many :absence_request_notifications
end
