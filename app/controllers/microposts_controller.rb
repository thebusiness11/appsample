class MicropostsController < ApplicationController
  
  before_filter :authenticate
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'pages/home'
    end
  end

  def destroy
    
  end



end