class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefectures

  with_option presence: true do
    validates :postal_code
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    validates :phone_number
  end

    validates :building_name

  belongs_to :item
end
