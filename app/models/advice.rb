class Advice < ApplicationRecord
  belongs_to :component
	validates :problem, :presence => true
	validates :explanation, :presence => true
end
