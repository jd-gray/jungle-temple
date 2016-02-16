class SignUpsController < BaseController

	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to dashboards_path }
        flash[:notice] = "Account successfully created"
      else
        format.html { render action: :new }
        flash[:alert] = "Your account could not be created :("
      end
    end
  end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, 
  															 :password, :password_confirmation)
  end
end