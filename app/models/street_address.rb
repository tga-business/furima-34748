class StreetAddress < ApplicationRecord

  has_many   :prefectures
  belongs_to :purchase_history
end
