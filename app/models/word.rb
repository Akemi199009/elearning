class Word < ApplicationRecord
  validates :content, presence: true
  validates :categories_id, presence: true
end
