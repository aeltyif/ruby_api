class JobPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @job = model
  end

  # If you are not an admin, you won't make job posts
  def create?
    @current_user.admin?
  end

  # Update a job post if you are an admin
  def update?
    @current_user.admin?
  end

  # Delete a job post if you are an admin
  def destroy?
    @current_user.admin? && current_user.id == @job.user_id
  end
end
