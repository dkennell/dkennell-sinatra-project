class ComedianFan < ActiveRecord::Base
    belongs_to :comedian
    belongs_to :fan
end