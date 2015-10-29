class SessionsController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]

	def create
		user = User.from_omniauth(env["omniauth.auth"])
		user.last_login_ip = request.remote_ip
		if user.register_ip.blank?
			require 'geoip'
			user.register_ip = user.last_login_ip
			user.ip_country = (GeoIP.new('app/assets/GeoLiteCity.dat').city(request.remote_ip).country_code2) rescue nil
		end
		user.save
		session[:user_id] = user.id
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end

end