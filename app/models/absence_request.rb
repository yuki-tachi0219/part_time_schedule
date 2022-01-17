class AbsenceRequest < ApplicationRecord
  belongs_to :schedules
  has_many :absence_request_notifications
end
