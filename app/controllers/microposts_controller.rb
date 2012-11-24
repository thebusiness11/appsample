class MicropostsController < ApplicationController
  
  before_filter :authenticate
  before_filter :authroized_user, :only => :destroy
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      respond_to  do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path, :flash => { :success => "Micropost deleted!" }
  end

  private
  def authroized_user
    @micropost = Micropost.find(params[:id])
    redirect_to root_path unless !current_user?(@micropost.user)    
  end

end