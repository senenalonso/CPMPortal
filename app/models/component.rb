class Component < ApplicationRecord
  belongs_to :project
	has_many :advices
	validates :name, :presence => true
end
