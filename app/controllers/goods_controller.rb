class GoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_campaign, only: [:goods_list]
  before_action :set_campaign_buy, only: [:buy]
  before_action :only_if_current_user_created_this_campaign

  def goods_list
    @goods = @campaign.goods
    @available_money = @campaign.budget
    money_spent = 0
    @campaign.goods.where(purchased: true).each do |good|
      money_spent = money_spent + good.cost
    end
    @available_money = @available_money - money_spent
  end

  def buy
    good = Good.find(params[:id])
    campaign = Campaign.find(good.campaign_id)
    available_money = campaign.budget
    money_spent = 0
    campaign.goods.where(purchased: true).each do |g|
      money_spent = money_spent + g.cost
    end
    available_money = available_money - money_spent

    if(available_money >= good.cost)

      good.purchased = true
      good.save

      offers = good.campaign.offers.where(good_id: 0)

      total = 0

      offers.each do |offer|
        if total < good.cost
          total += offer.donation
          if total > good.cost
            difference = total - good.cost
            offer.donation -= difference
            new_offer = Offer.new(campaign_id: offer.campaign_id, user_id: offer.user_id, comment: "")
            new_offer.donation = difference
            new_offer.save
            total = good.cost
          end
          offer.good_id = good.id
          offer.save
        else
          break
        end
      end
      flash[:success] = 'Acquisto andato a buon fine!'
      redirect_to goods_list_path(good.campaign)
    else
      flash[:error] = 'Soldi insufficienti!'
      redirect_to goods_list_path(campaign)
    end
  end

  private

  def set_campaign
      @campaign = Campaign.find(params[:id])
  end

  def set_campaign_buy
    @campaign = Campaign.find(Good.find(params[:id]).campaign_id)
  end

end
