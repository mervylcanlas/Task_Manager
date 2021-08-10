class Task < ApplicationRecord
    belongs_to :category
    validates :title, presence: true, uniqueness: {scope: :category}
    validates :description, presence: true, length: { minimum: 16 }
    validates :deadline, presence: true
end