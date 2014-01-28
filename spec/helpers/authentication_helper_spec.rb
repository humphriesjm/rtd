require "spec_helper"

describe AuthenticationHelper do
  let(:user_params) do
    {
      name: 'foo',
      email: 'foo@bar.com',
      org: 'foo inc',
      password: 'foo',
      password_confirmation: 'foo'
    }
  end

  describe "#current_user" do
    it "returns current user" do
      user = User.create!(user_params)
      session[:user_id] = user.id

      helper.current_user.should == user
    end

    it "returns nil if there's no user logged in" do
      session[:user_id] = nil
      helper.current_user.should == nil
    end

    it "only looks up user once" do
      User.expects(:find).with(1).returns({}).once

      session[:user_id] = 1

      helper.current_user
      helper.current_user
      helper.current_user
    end
  end
end