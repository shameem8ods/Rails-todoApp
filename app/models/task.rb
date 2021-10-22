class Task < ApplicationRecord
  validates :name,presence: true,length: {minimum:3, maximum:50}
  validates :description,presence: true
  belongs_to :user
end
