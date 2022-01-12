class Store < ApplicationRecord
  has_many :employees
  has_many :administrators
end
