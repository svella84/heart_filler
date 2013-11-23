class HeartController < ApplicationController
  def index
    @campaigns = Campaign.all
  end
end
