class Notification < ApplicationRecord
  belongs_to :shift_works
  belongs_to :absence
end
