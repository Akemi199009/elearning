class Word < ApplicationRecord
  validates :content, presence: true

  belongs_to :category, class_name: "Category", optional: true
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true




  
end
