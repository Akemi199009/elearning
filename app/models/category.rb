class Category < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :words, foreign_key: "category_id", dependent: :destroy

  
end
