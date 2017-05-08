require 'gmail'

class SessionsController < ApplicationController

	def index

		user = User.from_omniauth(request.env["omniauth.auth"])
		session[:user_id] = user.id

		redirect_to inbox_path

	end


	def show
	end

	def create
	user = User.from_omniauth(request.env["omniauth.auth"])
	session[:user_id] = user.id

	puts user.inspect
		if user.save
			redirect_to inbox_path, notice: "Succesfully login"
		else
			render 'new'
		end
	end

	def destroy
	session[:user_id] = nil
	redirect_to root_path
	end
end