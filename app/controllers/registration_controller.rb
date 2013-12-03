class RegistrationController < Devise::RegistrationsController

  def new
    @user= User.new
    @information = Information.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation =params[:user][:password_confirmation]

    @information = Information.new
    @information.name = params[:information][:name]
    @information.surname = params[:information][:surname]
    @user.valid?
    if @user.errors.blank?
      @user.save
      @information.user = @user
      @information.save
      redirect_to root_path
    else
      render :action => "new"
    end
  end

end
