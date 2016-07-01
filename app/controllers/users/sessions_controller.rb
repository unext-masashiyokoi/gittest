class Users::SessionsController < Devise::SessionsController
skip_before_filter :verify_authenticity_token
  def new
    super
  end
 
  def create
    super
  end
 
  def destroy
    super
  end
end
