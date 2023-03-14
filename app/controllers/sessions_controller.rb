class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    puts "User: #{user.inspect}"
    puts "User authenticated: #{user&.authenticate(params[:password])}"
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end
end
