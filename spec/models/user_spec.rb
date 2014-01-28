require "spec_helper"

describe User do

	it "has a password when created" do
		user = User.new
		user.save
		user.valid?.should be_false
		user.errors.messages[:password].should_not be_nil
	end

	it "has both password and password confirmation upon creation" do
		user = User.new
		user.password = "foobar"
		user.save
		user.errors.messages[:password_confirmation].should_not be_nil
	end

	it "has the same password and password_confirmation" do
		user = User.new
		user.password = "foobar"
		user.password_confirmation = "bazquux"
		user.save
		user.errors.messages[:password_confirmation].should_not be_nil # "doesn't match Password"
	end

	it "saves user with proper passwords" do
		user = User.new
		user.password = "foobar"
		user.password_confirmation = "foobar"
		user.name = "foo1"
		user.email = "foo1@example.com"
		user.org = "foo organization"
		user.save
		user.valid?.should be_true
	end

end