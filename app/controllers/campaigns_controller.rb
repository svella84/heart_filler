class CampaignsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :my_index, :destroy]
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :only_if_current_user_created_this_campaign, only: [:edit, :update, :destroy]
  before_action :only_if_not_expired_and_target_not_achieved, only: [:edit, :update]

  
  def new
  	@campaign = Campaign.new
  end

  def create
  	@campaign = current_user.campaigns.build(campaign_params)

  	if @campaign.save
  	  flash[:success] = 'Campagna creata con successo'
  	  redirect_to my_index_path
  	else
  	  render action: 'new'
  	end
  end

  def edit
  end

  def update

    if @campaign.update(update_campaign_params)
      flash[:success] = 'Campagna aggiornata con successo'
      redirect_to my_index_path
    else
      render action: 'edit'
    end

  end

  def show
  end

  def index
  	@campaigns = Campaign.all.paginate(page: params[:page], per_page: 1)
  end

  def my_index
  	@campaigns = current_user.campaigns.paginate(page: params[:page], per_page: 1)
  end

  def destroy
    offers = @campaign.offers

    offers.each do |offer|
      info = offer.user.information
      info.add_credit(offer.donation)
    end

    @campaign.destroy
    redirect_to my_index_path
  end

  private

    def campaign_params
      #aggiungere immagine
      params.require(:campaign).permit(:title, :description, :target, :expiration, :image_url)
    end

    def update_campaign_params
      # aggiungere immagine
      params.require(:campaign).permit(:title, :description)
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end
end
