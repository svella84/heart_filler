class Offer < ActiveRecord::Base

	validates :campaign_id, :precence => true
	validates :user_id, :precence => true
	validates :donation, :precence => true
	validates :content, :precence => true,
	    		    :lenght => { :maximum => 1000 }

  has_many :campaigns
  has_many :users, :through => :campaigns
end
