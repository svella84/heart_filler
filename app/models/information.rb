class Information < ActiveRecord::Base
  belongs_to :user

  ONLY_LETTERS_REGEX = /\A[a-zA-Z]+\z/

  validates :name, :presence => true,
    :format => { 
      :with => ONLY_LETTERS_REGEX,
    }
  validates_length_of :name, minimum: 2, maximum: 30, allow_blank: true
  
  validates :surname, :presence => true,
    :format => {
      :with => ONLY_LETTERS_REGEX,
    }
  validates_length_of :surname, minimum: 2, maximum: 30, allow_blank: true

end
