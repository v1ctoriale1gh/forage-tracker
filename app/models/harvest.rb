class Harvest < ApplicationRecord
    belongs_to :expedition
    belongs_to :item
    accepts_nested_attributes_for :item
end
#"expedition"=>
#  {"location_name"=>"", 
#  "date_and_time"=>"", 
#  "latitude"=>"", 
#  "longitude"=>"", 
#  "description"=>"", 
#  "harvests_attributes"=>{
#      "0"=>{"item_id"=>"", "items"=>{"name"=>"", "description"=>""}, "amount"=>""},
#      "1"=>{"item_id"=>"", "items"=>{"name"=>"", "description"=>""}, "amount"=>""},
#      "2"=>{"item_id"=>"", "items"=>{"name"=>"", "description"=>""}, "amount"=>""},
#      "3"=>{"item_id"=>"", "items"=>{"name"=>"", "description"=>""}, "amount"=>""}, 
#      "4"=>{"item_id"=>"", "items"=>{"name"=>"", "description"=>""}, "amount"=>""}}}