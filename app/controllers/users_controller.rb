class UsersController < Devise::RegistrationsController

  def show
  end

  def add_credit
  	@info = current_user.information
  end

  def update_credit
  	@info = current_user.information
    quantity = params[:information][:credit]
    new_credit = @info.credit + quantity.to_f
    if @info.check_credit(quantity)
      @info.update(credit: new_credit)
      flash[:success] = "#{quantity}"
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
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :information_attributes => [:name, :surname, :date_of_birth, :address, :city, :country, :post_code, :phone])
  end

end
