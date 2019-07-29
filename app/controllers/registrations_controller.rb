class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:f_name, :l_name, :email, :password,
                                 :password_confirmation, :has_company, :admin)
  end

  def account_update_params
    params.require(:user).permit(:f_name, :l_name, :email, :password, :password_confirmation,
                                 :current_password, :has_company, :admin)
  end
end
