class HomeController < ActionController::Base

  def index
    @title = "Grubly!"
    # Store whatever variables we choose to display here, example:
    #
    # @user = current_user if signed_in
    # @favorites = @user.favorites
  end

end
