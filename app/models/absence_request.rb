class AbsenceRequest < ApplicationRecord
  belongs_to :schedule
<<<<<<< HEAD
  has_many :absence_request_notifications
  enum state: {
    application: 0, #申請中
    approval: 1,  #承認
    rejection: 2  #却下
  }
=======
  has_many :absence_request_notifications, dependent: :destroy
  has_many :notifications, through: :absence_request_notifications
>>>>>>> cdfa58a (モデルの記載ミス修正)
end
