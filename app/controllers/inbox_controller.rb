require 'gmail'

class InboxController < ApplicationController
	def index

		user = User.find(session[:user_id])

		@gmail = Gmail.connect(:xoauth2, user.email, user.oauth_token)

		@email = @gmail.inbox.find(:unread)
	
	end
end
