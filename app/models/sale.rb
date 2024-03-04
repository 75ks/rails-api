class Sale < ApplicationRecord
  belongs_to :packedsale, primary_key: :psales_no, foreign_key: :psales_no
end
