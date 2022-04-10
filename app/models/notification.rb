class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  has_many :attendance_requests, through: :attendance_request_notifications
  has_many :attendance_request_notifications
  has_many :absence_request_notifications
  enum action: {
    application: 0, #申請
    approval: 1,  #承認
    rejection: 2  #却下
  }
end
