class User < ApplicationRecord
    has_secure_password
    has_many :expeditions
    has_many :harvests, through: :expeditions
    validates :email_address, uniqueness: true
    
    def found_items
        #self.harvests.collect(&:item).uniq
        self.harvests.collect {|harvest| harvest.item }.uniq
    end
#
    #def found_items_harvests
    #    self.found_items.collect {|items| items.harvests }
    #end
#
    def dated_harvests
      self.expeditions.order(:date_and_time).collect(&:harvests)
    end

end

#user.expeditions.order(:date_and_time).map(&:harvests)