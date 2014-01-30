class HeartFillerController < ApplicationController

  def index

  	@total_donations = 0
  	Offer.all.each do |offer|
  		@total_donations = @total_donations + offer.donation
  	end

  	@animal, @art, @children, @education, @medical, @other = 0, 0, 0, 0, 0, 0

  	Campaign.where(category_id: 1).each do |campaign|
  		campaign.offers.each do |offer|
  			@animal = @animal + offer.donation
  		end
  	end

  	Campaign.where(category_id: 2).each do |campaign|
  	    campaign.offers.each do |offer|
  	      @art = @art + offer.donation
  	  end
  	end

  	Campaign.where(category_id: 3).each do |campaign|
  	  campaign.offers.each do |offer|
  	    @children = @children + offer.donation
  	  end
  	end

  	Campaign.where(category_id: 4).each do |campaign|
  	  campaign.offers.each do |offer|
  	    @education = @education + offer.donation
  	  end
  	end

  	Campaign.where(category_id: 5).each do |campaign|
  	  campaign.offers.each do |offer|
  	    @medical = @medical + offer.donation
  	  end
  	end

  	Campaign.where(category_id: 6).each do |campaign|
  	  campaign.offers.each do |offer|
  	    @other = @other + offer.donation
  	  end
  	end

  end

end
