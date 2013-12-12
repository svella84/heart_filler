class UsersController < Devise::RegistrationsController
  before_action :only_signed_in_user, only: [:show, :add_credit, :update_credit]

  def show
  end

  def add_credit
  	@info = current_user.information
  end

  def update_credit
  	@info = current_user.information
    if @info.add_credit(params[:information][:credit])
      flash[:success] = "Credito aggiunto correttamente!"
      redirect_to profile_path
    else
      render :action => 'add_credit'
    end
  end

  private

  def sign_up_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :information_attributes => [:name, :surname])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :information_attributes => [:name, :surname, :date_of_birth, :address, :city, :country, :post_code, :phone, :image_url])
  end

  def after_update_path_for(resource)
    profile_path
  end

end
