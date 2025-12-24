class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  attribute :body, validate: true
  validates :body, presence: true, length: {minimum: 5}
end
