class SessionsController < ApplicationController
  def new
      @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:emaii], params[:session][:password])
    
    if user.nil?
      flash.now[:error] = "Invalid email/passwrord conmination "
      @title = "Sign in"
      render 'new'
    else
      
    end
#handle it
end


  def destroy
    
  end

end
