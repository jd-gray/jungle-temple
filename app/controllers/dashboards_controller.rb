class DashboardsController < BaseTenantController
	before_filter :find_user, only: [:show]

	def index
		@users = User.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
		@locations = Location.all
	end

	def show
		if params[:zip_code] != nil
			begin
				@location = Location.save_response(params[:zip_code], params[:user])
				flash[:notice] = "Location added!"
			rescue Exception
				flash[:alert] = "Whoops something went wrong, check your zip code"
			end
			redirect_to dashboard_path
		end
		@locations = Location.where(user_id: @user.id).order("created_at desc").paginate(page: params[:page], per_page: 10)
		gon.locations = @locations
	end

	def search
		if params[:q].present?
			@users = User.search(params[:q])
		else
			@users = User.all.order("created_at desc").paginate(page: params[:page], per_page: 10)
		end	
	end

	private

	def find_user
		@user = User.find(params[:id])
	end

end