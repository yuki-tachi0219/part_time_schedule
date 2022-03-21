class AttendanceRequest < ApplicationRecord
  belongs_to :schedule
  has_many :attendance_request_notifications
  enum state: {
    application: 0, #申請中
    approval: 1,  #承認
    rejection: 2  #却下
  }
end
