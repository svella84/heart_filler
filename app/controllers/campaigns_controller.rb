class CampaignsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :my_index, :destroy]
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :only_if_current_user_created_this_campaign, only: [:edit, :update, :destroy]
  before_action :only_if_not_expired_and_target_not_achieved, only: [:edit, :update]

  
  def new
    @campaign = Campaign.new
    @campaign.goods.build
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)

    if check_sum
  	  if @campaign.save
  	    flash[:success] = 'Campagna creata con successo'
  	    redirect_to my_index_path
    	else
  	    render action: 'new'
    	end
    else
      @params = params[:campaign][:goods_attributes]
      flash.now[:error] = "La somma dei beni deve essere uguale al target della campagna!"
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
    @donations = @campaign.offers.paginate(page: params[:page], per_page: 10)

    difference = @campaign.expiration - (Time.now + 1.hour)
    @days = (difference/86400).to_i
    difference = difference - @days*86400
    @hours = (difference/3600).to_i
    difference = difference - @hours*3600
    @minutes = (difference/60).to_i
    difference = difference - @minutes*60
    @seconds = (difference).to_i
  end

  def index
    @categories = Category.all
    category = params[:category]
    if category == "" || category == nil
  	  @campaigns = Campaign.all.paginate(page: params[:page], per_page: 5)
    else
      @campaigns = Campaign.where(category_id: category).paginate(page: params[:page], per_page: 5)
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
  	    @childer = @childer + offer.donation
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

  def my_index
  	@campaigns = current_user.campaigns.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    campaign = Campaign.find(params[:id])
    offers = campaign.offers

    offers.each do |offer|
      info = offer.user.information
      info.add_credit(offer.donation)
    end

    campaign.destroy
    redirect_to my_index_path
  end

  private

    def campaign_params
      params.require(:campaign).permit(:title, :category_id, :description, :target, :expiration, :image_url, goods_attributes: [:name, :description, :cost, :_destroy])
    end

    def update_campaign_params
      params.require(:campaign).permit(:title, :category_id, :description, :image_url)
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def check_sum
      sum = 0
      params[:campaign][:goods_attributes].each do |key, hash|
        if hash[:_destroy] != "true"
          sum += hash[:cost].to_f
        end
      end

      if sum == params[:campaign][:target].to_f
        return true
      else
        return false
      end
    end
end