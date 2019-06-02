class Cities < ApplicationRecord
  validates_presence_of :search_name,
                        :latitude,
                        :longitude,
                        :name,
                        :state_abrev,
                        :country    
end
