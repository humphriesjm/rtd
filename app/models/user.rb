class User < ActiveRecord::Base
	has_many :reservations
	has_many :events, through: :reservations

	validates :name, presence: true
	validates :org, presence: true
	validates :email, presence: true
end
