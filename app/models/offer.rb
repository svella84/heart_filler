class Offer < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  belongs_to :good
end
