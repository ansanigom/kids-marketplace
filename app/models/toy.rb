class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
  validates :dates_available, presence: true
  validates :price, presence: true
  validates :availability, presence: true
  enum condition: { brand_new: 0, damaged: 1 }
end
