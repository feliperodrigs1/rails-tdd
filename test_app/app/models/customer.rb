class Customer < ApplicationRecord
  has_many :orders

  validates_presence_of :address

  def full_name
    "Mister #{name}"
  end
end
