class MtvItem < ApplicationRecord
  validates :url, uniqueness: true
end
