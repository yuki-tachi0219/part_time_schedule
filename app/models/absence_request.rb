class AbsenceRequest < ApplicationRecord
  belongs_to :employee
  belongs_to :administrator

  has_many :absence_request_notifications
end
