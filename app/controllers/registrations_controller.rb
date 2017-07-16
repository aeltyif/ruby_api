class RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      admin: params[:admin]
    )
    if user.save
      render json: user
    else
      render json: {errors: ["This email already exists"]},status: :unprocessable_entity
    end
  end
end
