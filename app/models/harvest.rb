class Harvest < ApplicationRecord
    belongs_to :expedition
    belongs_to :item
end
