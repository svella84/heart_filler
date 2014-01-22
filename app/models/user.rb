class User < ActiveRecord::Base
  has_many :campaigns
  has_many :offers
  has_one :information, dependent: :destroy

  accepts_nested_attributes_for :information, update_only: true

  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
  		 :recoverable, :rememberable, :trackable,
  		 :validatable, :confirmable, :lockable

end
