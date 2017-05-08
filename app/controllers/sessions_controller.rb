class SessionsController < ApplicationController

	def index
	require 'gmail'

	# user = User.from_omniauth(request.env["omniauth.auth"])
	# session[:user_id] = user.id

	gmail = gmail = Gmail.connect(:xoauth2, gmail, "TOKEN")

	gmail.inbox.find(:unread).each do |email|
		puts email.body

		end

	gmail.logout
	end

	if __FILE__ == $PROGRAM_NAME
		main()
	end

	def show
	end

	def create
	user = User.from_omniauth(request.env["omniauth.auth"])
	session[:user_id] = user.id

	puts user.inspect
		if user.save
			redirect_to index_path, notice: "Succesfully login"
		else
			render 'new'
		end
	end

	def destroy
	session[:user_id] = nil
	redirect_to root_path
	end
end