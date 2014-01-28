require "spec_helper"

describe SessionsController do
  let(:user_params) do
    {
      name: 'foo',
      email: 'foo@bar.com',
      org: 'foo inc',
      password: 'foo',
      password_confirmation: 'foo'
    }
  end
  let(:session_params) do
    {
      email: 'foo@bar.com',
      password: 'foo'
    }
  end

  describe "#create" do
    it "stores user id in the session" do
      user = User.create(user_params)

      post :create, session: session_params
      
      session[:user_id].should == user.id
    end

    it "redirects the home page on successful login" do
      user = User.create(user_params)

      post :create, session: session_params

      response.should redirect_to(root_path)
    end
  end

end