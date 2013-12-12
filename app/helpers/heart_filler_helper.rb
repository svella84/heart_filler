# encoding: UTF-8
module HeartFillerHelper

  private

    def only_signed_in_user
    	unless current_user
    	  flash[:notice] = 'Devi essere loggato per avere accesso a tale funzione'
    	  redirect_to root_path
    	end
    end

    def current_user_created_this_campaign?
    	@campaign.user_id == current_user.id
    end

    def only_if_current_user_created_this_campaign
    	unless current_user_created_this_campaign?
    		flash[:error] = 'Permesso negato!'
    		redirect_to my_index_path
    	end
    end

    def target_achieved?(campaign)
      campaign.budget == campaign.target
    end

    def expiration_done?(campaign)
      Time.now.utc + 1.hour > campaign.expiration.utc
    end

    def only_if_not_expired_and_target_not_achieved
      if expiration_done?(@campaign) || target_achieved?(@campaign)
        flash[:notice] = "Campagna terminata! Non è più possibile modificarla"
        redirect_to my_index_path
      end
    end

end
