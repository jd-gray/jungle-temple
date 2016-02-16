module DashboardsHelper
	def correct_user?
		@user = User.find(params[:id])
		@user == current_user
	end
end