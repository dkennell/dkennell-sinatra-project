class Comedian < ActiveRecord::Base
    has_many :cds
    has_many :specials
    #has_many :fans, through: :comedian_fans
    has_many :comedian_fans
    has_many :fans, through: :comedian_fans
    validates :username, :uniqueness => true
    validates :username, :length => { :minimum => 2 }
    validates :password, :length => { :minimum => 2 }
    validates :name, :length => { :minimum => 2 }
    validates :name, :uniqueness => true
 
    def slug
        self.name.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug)
        Comedian.all.detect do |comedian|
            comedian.slug == slug
        end
    end
    
end