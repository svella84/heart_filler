class User < ActiveRecord::Base
  has_many :campaigns
  has_one :information, :dependent => :destroy # Quando un utente viene cancellato anche la relativa tabella di info viene cancellata
  has_many :offers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
