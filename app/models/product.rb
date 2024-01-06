class Product < ApplicationRecord
  has_many :variants
  accepts_nested_attributes_for :variants
  validates :title, presence: true, uniqueness: true
end
