class Purchase < ApplicationRecord
  belongs_to :user
  berongs_to :item
end
