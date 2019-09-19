class Activity < ApplicationRecord
validates :action_id, presence: true
validates :action_type, presence: true
validates :user_id, presence: true

  belongs_to :action, polymorphic: true
  belongs_to :user
end
