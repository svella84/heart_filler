class Campaign < ActiveRecord::Base

	validates :title, :presence => true,
                          :uniqueness => true

	validates :description, :presence => true
	validates :target, :presence => true,
			   :numericality => { :greater_than => 0, }

  belongs_to :category
  has_many :goods
end
