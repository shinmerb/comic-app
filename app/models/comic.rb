class Comic < ApplicationRecord
  belongs_to :publisher
  has_many :comic_authors
  has_many :authors, through: :comic_authors

  accepts_nested_attributes_for :comic_authors
end
