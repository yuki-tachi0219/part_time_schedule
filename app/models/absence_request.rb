class AbsenceRequest < ApplicationRecord
  belongs_to :schedule
  has_many :absence_request_notifications, dependent: :destroy
  has_many :notifications, through: :absence_request_notifications
end
