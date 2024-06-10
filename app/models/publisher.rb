class Publisher < ApplicationRecord
  has_many :comics

  validates :name, presence: true
  validates :address, presence: true
end
