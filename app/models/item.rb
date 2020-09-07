class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :delivery
  belongs_to_active_hash :origin
  belongs_to_active_hash :status

  with_options presence: true do
    validates :images
    validates :name,                length: { maximum: 40 }
    validates :product_explanation, length: { maximum: 1000 }
    validates :price,               numericality: { greater_than_or_equal_to: 300 },
                                    numericality: { less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id, presence: true
    validates :charge_id,   presence: true
    validates :delivery_id, presence: true
    validates :origin_id,   presence: true
    validates :status_id,   presence: true
  end

  belongs_to :user
  has_one    :purchase
  has_one    :address
  has_many_attached :images
end
