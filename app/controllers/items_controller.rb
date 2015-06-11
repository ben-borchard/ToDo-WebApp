class ItemsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@item = @user.items.new(item_params)
		@item.done = false

		if (@item.save)
			redirect_to '/users/'+@user.id.to_s
			# render :partial => "items/item", :locals => {:item => @item}
		else
			render :js => 'alert("error saving item");'
		end

	end

	def destroy
		@user = User.find(params[:user_id])
		@item = @user.items.find(params[:id])

		@item.destroy

		redirect_to '/users/'+@user.id.to_s
	end

	def edit
		@user = User.find(params[:user_id])
		@item = @user.items.find(params[:id])		
	end

	def update
		@user = User.find(params[:user_id])
		@item = @user.items.find(params[:id])		

		if @item.update(item_params)
			redirect_to '/users/'+@user.id.to_s
		else	
			render :js => 'alert("error saving item");'
		end
	end

	private
		def item_params
			params.require(:item).permit(:description, :done_by, :importance_level)
		end

end
