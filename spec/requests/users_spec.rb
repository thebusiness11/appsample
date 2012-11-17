require 'spec_helper'

describe "Users" do
  
  describe "signup" do

    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",         :with => ""
          fill_in "Email",        :with => ""
          fill_in "Password",     :with => ""
          fill_in "Confirmation", :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector('div#error_explanation')
        end.should_not change(User, :count)
      end
    end
    
    describe "succes" do
      it "should make a user" do
        lambda do
              fill_in "Name",         :with => "Example USer"
              fill_in "Email",        :with => "user@exaple.com"
              fill_in "Password",     :with => "foobar"
              fill_in "Confirmation", :with => "foobar"
              click_button
    end
      end
    end
    
    describe "signin" do
      
      describe "failure" do
        it "shoiuld not sign a user in" do
          visit signin_path
          fill_in "Email", :with => ""
          fill_in "Password", :with => ""
          click_button
          response.should have_selector('div.alert.alert-error', :content => "Invalid")
          response.should render_template('sessions/new')
        end
      end
      
      describe "success" do
        it "should sign user in/out" do
          user = Factory(:user)
          visit signin_path
          fill_in "Email", :with => user.email
          fill_in "Password", :with => user.password
          click_button
          controller.should be_signed_in
          click_link "Sign out"
          controller.should_not be_signed_in
        end
      end
    end
    describe "micropost associations" do

      before(:each) do
        @user = User.create(@attr)
        @mp1 = Factory(:micropost, :user => @user, :created_at => 1.day.ago)
        @mp2 = Factory(:micropost, :user => @user, :created_at => 1.hour.ago)
      end

      it "should have a microposts attribute" do
        @user.should respond_to(:microposts)
      end

      it "should have the right microposts in the right order" do
        @user.microposts.should == [@mp2, @mp1]
      end

      it "should destroy associated microposts" do
        @user.destroy
        [@mp1, @mp2].each do |micropost|
          lambda do
            Micropost.find(micropost)
            end.should raise_error(ActiveRecord::RecordNotFound)
            end
            end
            end    
  end
end