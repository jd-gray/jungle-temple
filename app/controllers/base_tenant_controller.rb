class BaseTenantController < BaseController
	before_action :authenticate_user!
end