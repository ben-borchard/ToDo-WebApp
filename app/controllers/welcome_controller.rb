class WelcomeController < ApplicationController

	skip_before_action :authenticate_user!

  # GET /welcome
  def index

  end

end
