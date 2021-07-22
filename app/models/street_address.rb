class StreetAddress < ApplicationRecord

  # with_options presence true do
  #   validates :postal_code
  #   validates :from_city
  #   validates :from_address
  #   validates :building
  #   validates :phone_number
  # end

  # with_options numericality: { other_than: 1 } do
  #   prefecture_id
  # end

  has_many   :prefectures
  belongs_to :purchase_history
end
