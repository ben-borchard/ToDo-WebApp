class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@items = @user.items.order(done_by: :asc, importance_level: :desc)
	end
end
