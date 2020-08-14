class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :charge, :delivery, :origin, :status
  
  with_options presence: true do
    validates :exhibition_image
    validates :name,                length: { maximum: 40 }
    validates :product_explanation, length: { maximum: 1000 }
    validates :price,               numericality: { :greater_than => 300 }, { :less_than_or_equal_to => 9999999 } 
  end

  with_options numericality: { other_than: 1 }
    validates:category_id, presence: true
    validates:charge_id,   presence: true
    validates:delivery_id, presence: true
    validates:origin_id,   presence: true
    validates:status_id,   presence: true
  end

  belongs_to :user
  has_one    :purchase
  has_one    :address
end
