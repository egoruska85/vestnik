class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many_attached :pictures
  has_many :comments
end
