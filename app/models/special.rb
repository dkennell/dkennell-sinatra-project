class Special < ActiveRecord::Base
    belongs_to :comedian
    validates :name, :length => {:minimum => 2}

    def slug
        self.name.downcase.gsub(" ", "-")
    end
    
    def self.find_by_slug(slug)
        Special.all.detect do |cd|
            cd.slug == slug
        end
    end
    
end