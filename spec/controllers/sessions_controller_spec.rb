require "spec_helper"

describe SessionsController do
  describe "#create" do
    it "stores user id in the session" do
      user = User.create(
        name: 'foo',
        email: 'foo@bar.com',
        org: 'foo inc',
        password: 'foo',
        password_confirmation: 'foo'
      )

      post :create, session: {
        email: 'foo@bar.com',
        password: 'foo'
      }
      
      session[:user_id].should == user.id
    end
  end
end