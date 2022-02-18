class Discussion < ApplicationRecord
  has_many :posts

  validates :title, presence: true
end
