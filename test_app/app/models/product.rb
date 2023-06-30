class Product < ApplicationRecord
  belongs_to :category

  validates_presence_of :description, :price, :category

  def full_description
    "#{description} - #{self.price}"
  end
end
