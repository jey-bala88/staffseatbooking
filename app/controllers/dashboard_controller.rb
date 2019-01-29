class DashboardController < ApplicationController
	before_action :authenticate_user!
	layout 'main'
	def index
	end
end
