class User < ApplicationRecord
    has_secure_password
    has_many :expeditions
    has_many :harvests, through: :expeditions
    validates :email, uniqueness: true

    
    def found_items
        self.harvests.collect(&:item).uniq.sort
    end

    def dated_harvests
      self.expeditions.order(:date_and_time).collect(&:harvests)
    end

    def location_harvests
        self.expeditions.location_group.collect(&:harvests)
    end

    def self.find_or_create_by_omniauth(auth_hash)
        attribute = self.set_omniauth_attribute(auth_hash)
        self.find_or_create_by(attribute) do |user|
          user.username      = self.auth_hash.username
          user.email      = self.auth_hash.email
          user.uid = auth_hash[:uid]
          user.password   = SecureRandom.hex
        end
      end

   def self.set_omniauth_attribute(auth_hash)
     if auth_hash[:info][:email].present? then { :email => auth_hash[:info][:email] }
      else { :uid => auth_hash[:uid] }
      end
   end
end

#user.expeditions.order(:date_and_time).map(&:harvests)