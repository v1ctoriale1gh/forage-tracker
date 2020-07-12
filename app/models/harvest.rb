class Harvest < ApplicationRecord
    belongs_to :expedition
    belongs_to :item
    accepts_nested_attributes_for :item, reject_if: proc { |attributes| attributes['name'].blank? }
    
    validates :amount, presence: true
end
