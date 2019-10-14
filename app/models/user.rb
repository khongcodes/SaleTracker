class User < ActiveRecord::Base
    has_secure_password
    has_many :items

    ####   SLUG   ####
    def slug
        self.username.gsub(" ", "-").downcase
    end
    
    def self.find_by_slug(slug)
        name = slug.gsub("-"," ")
        self.find_by(username:name)
    end
end