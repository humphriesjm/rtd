class User < ActiveRecord::Base
	has_many :reservations
	has_many :events, through: :reservations
end
