class Good < ActiveRecord::Base
  belongs_to :campaign
  has_many :offers
 
  validates :name, :presence => true

  validates :description, :presence => true
  
  validates :cost, :presence => true,
    		:numericality => { :greater_than_or_equal_to => 1 }

end
