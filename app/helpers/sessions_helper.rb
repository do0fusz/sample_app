module SessionsHelper
	
	#signing in the user
	  def sign_in(user)
	    remember_token = User.new_remember_token
	    cookies.permanent[:remember_token] = remember_token
	    user.update_attribute(:remember_token, User.encrypt(remember_token))
	    self.current_user = user
	  end

	  #signing out the user without setting a new :remember_token
	  def sign_out
	  	current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
	  	cookies.delete(:remember_token)
	  	self.current_user = nil
	  end

	def current_user?(user)
		user == current_user
	end

	#setting the current user
	def current_user=(user)
		@current_user = user
	end

	#finding and setting the current user if not ready set 
	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	# is the user signed in ? 
	def signed_in?
		!current_user.nil?
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url if request.get?
	end


end
