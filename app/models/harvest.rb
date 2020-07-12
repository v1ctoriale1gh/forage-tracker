class Harvest < ApplicationRecord
    belongs_to :expedition
    belongs_to :item
    accepts_nested_attributes_for :item
    
    validates :amount, :item_id, presence: true
end
