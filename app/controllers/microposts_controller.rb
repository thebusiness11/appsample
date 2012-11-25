class MicropostsController < ApplicationController
  
  before_filter :authenticate
  before_filter :authroized_user, :only => :destroy
 
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    respond_to do |format|
      if @micropost.save!
        format.html { redirect_to root_path }
        format.js
      else
        format.js { render :flash=>'alert("Cant have a blank tweet bro");' }
      end
    end
  end



  def show
    @micropost = current_user.microposts.build(params[:micropost])
  end

  def destroy
    @micropost.destroy
    respond_to do |format|
      format.html { redirect_to(@user) }
      format.js
    end
  end

  private
  def authroized_user
    @micropost = Micropost.find(params[:id])
    redirect_to root_path unless !current_user?(@micropost.user)    
  end

end