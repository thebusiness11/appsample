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
    
  end
end