class Category < ApplicationRecord
  has_one_attached :icon
  has_many :ads
end
