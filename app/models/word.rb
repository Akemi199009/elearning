class Word < ApplicationRecord
  validates :content, presence: true

  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true

  has_many :answers

  validate :check_one_choices

 def check_one_choices
  one_choices_count = choices.select { |choice| choice.correct? }.count
   if one_choices_count > 1 
    errors.add(:choices, "should have one correct answer.")
   elsif one_choices_count == 0
    errors.add(:choices, "Please choose one correct answer.")
   end
 end

 def correct_choice
  choices.find_by(correct: true)
 end
 

  
end
