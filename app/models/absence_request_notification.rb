class AbsenceRequestNotification < ApplicationRecord
  belongs_to :absence_request
  belongs_to :notification
end
