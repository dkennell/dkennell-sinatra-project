class Fan < ActiveRecord::Base
    has_many :comedian_fans
    has_many :comedians, through: :comedian_fans
    validates :username, :uniqueness => true
    validates :username, :length => { :minimum => 2 }
    validates :password, :length => { :minimum => 2 }
    validates :name, :length => { :minimum => 2 }
    validates :name, :uniqueness => true
    
    def slug
        self.name.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug)
        Fan.all.detect do |fan|
            fan.slug == slug
        end
    end

end