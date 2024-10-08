class Comic < ApplicationRecord
  belongs_to :publisher
  has_many :comic_authors, dependent: :destroy
  has_many :authors, through: :comic_authors

  accepts_nested_attributes_for :comic_authors

  validate :at_least_one_author

  private

  def at_least_one_author
    if comic_authors.empty?
      errors.add(:base, "著者を最低1人は選択してください")
    end
  end
end
