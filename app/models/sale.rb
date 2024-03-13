class Sale < ApplicationRecord
  belongs_to :packedsale, foreign_key: :psales_no
end
