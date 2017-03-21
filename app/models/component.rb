class Component < ApplicationRecord
  belongs_to :project
	has_many :advices
	validates :name, :presence => true

	def self.get_components_by_filter(filter)
		Component.where(filter)		
	end

end
