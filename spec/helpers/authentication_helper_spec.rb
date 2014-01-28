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
  end
end