class Ad < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :image
  has_many_attached :images

  def self.ransackable_attributes(auth_object = nil)
    ["title", "body", "phone", "active", "created_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
