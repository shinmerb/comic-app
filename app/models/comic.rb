class Comic < ApplicationRecord
  belongs_to :publisher
  has_many :comic_authors
  has_many :authors, through: :comic_authors
end
