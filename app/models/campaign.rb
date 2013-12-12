class Campaign < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :offers, dependent: :destroy
  has_many :goods

  accepts_nested_attributes_for :goods 

  has_attached_file :image_url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates :title, :description, :target, :expiration, presence: true

  validates :title, uniqueness: { case_sensitive: false }
  validates_length_of :title, minimum: 4, maximum: 255, allow_blank: true

  validates :target, numericality: { greater_than_or_equal_to: 0.01 }

  validate :check_date

  private

    def check_date
  	  if (expiration.utc - (Time.now.utc + 1.hour)) <= 0
  	    errors.add(:expiration, 'must be a valid date')
    	end
    end
       
end
