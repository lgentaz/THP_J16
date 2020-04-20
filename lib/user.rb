require 'pry'

class User
	attr_accessor :email, :age
	@@user_count = 0
	@@all_users = []

	def initialize(email_to_save, age_to_save)
			@email = email_to_save
			@age = age_to_save
			@@user_count = @@user_count + 1
			@@all_users << self
	end

	def self.all
		return @@all_users
	end

	def self.count
		return @@user_count
	end

	def self.find_by_email(user_email)
		@@all_users.each do |user_e|
			if user_e.email == user_email
				puts user_e.age
				return user_e
			end
		end
	end

end
