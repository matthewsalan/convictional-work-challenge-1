class Variant < ApplicationRecord
  belongs_to :product
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  validates :title, presence: true, uniqueness: true
  validates :sku, presence: true, uniqueness: true
end
