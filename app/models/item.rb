class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :quality
  belongs_to_active_hash :payment
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days
  validates :name, :image, :price, :text, :genre_id, :quality_id, :payment_id, :prefecture_id, :days_id, presence: true
  validates :price, numericality:{less_than: 9999999,greater_than: 300}
  validates :genre_id, numericality:{ other_than: 0 }
  validates :quality_id, numericality:{ other_than: 0 }
  validates :payment_id, numericality:{ other_than: 0 }
  validates :prefecture_id, numericality:{ other_than: 0 }
  validates :days_id, numericality:{ other_than: 0 }

  belongs_to :user
  has_many :comments
  has_one :order
  has_one_attached :image
end
