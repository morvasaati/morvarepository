class RegistrationsController < Devise::RegistrationsController

  

  def create
    super
  end

  def after_sign_up_path_for(user)
    redirect_to :controller => 'profiles' ,:action => 'create'
  end
  
end
