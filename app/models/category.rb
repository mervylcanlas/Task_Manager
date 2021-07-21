class Category < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, uniqueness: {scope: :user}
  validates :details, presence: true, length: { minimum: 10 }
  has_many :tasks, dependent: :destroy
end
