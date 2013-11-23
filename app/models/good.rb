class Good < ActiveRecord::Base

	validates :title, :presence => true
	validates :description, :presence => true
	validates :user_id,  :presence => true
	validates :target, :presence => true,
			   :numericality => {
				:greater_than_or_equal_to => 1, 
			   }
	validates :expiration, :presence => true

  belongs_to :user
  has_many :offers
end
