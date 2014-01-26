class OffersController < ApplicationController
  before_action :authenticate_user!
  
  def new
  	@campaign = Campaign.find(params[:id])
  	@offer = Offer.new
  end

  def create
  	donation = params[:offer][:donation]
  	@campaign = Campaign.find(params[:id])
  	@offer = current_user.offers.build(campaign_id: @campaign.id, comment: params[:offer][:comment])
  	
  	credit = current_user.information.credit.to_f
    donation.gsub!(",", ".")
  	donation = donation.to_f

  	if(credit-donation >= 0)
  	  
  	  if (@campaign.budget + donation)> @campaign.target
  	  	donation = @campaign.target - @campaign.budget
  	  end

      campaign_budget = @campaign.budget + donation
      @campaign.update_attribute("budget", campaign_budget)

  	  current_user.information.credit = credit - donation
  	  current_user.save

  	  @offer.donation = donation
  	  @offer.save

  	  redirect_to campaign_path(@campaign)

  	else
  	  flash.now[:error] = 'Credito insufficiente'
  	  render 'new'
  	end

  end

  def show
  end

  def index
    @offers = current_user.offers
  end

end