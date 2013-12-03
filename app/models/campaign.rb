class Campaign < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :offers
  has_many :goods

  validates :title, :presence => true,
    :uniqueness => { case_sensitive: false }
  validates_length_of :title, minimum: 4, maximum: 255, allow_blank: true

  validates :description, :presence => true

  validates :target, :presence => true,
            :numericality => { :greater_than_or_equal_to => 0.01 }
  #fare in modo che 0.0156  si analizzato

  validate :check_date

  has_attached_file :image_url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  private

  def check_date
  	if (expiration - Time.now - 1.hours) <= 0
  	  errors.add(:expiration, 'must be a valid date')
  	end
  end

end
