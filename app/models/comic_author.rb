class ComicAuthor < ApplicationRecord
  belongs_to :comic
  belongs_to :author
end
