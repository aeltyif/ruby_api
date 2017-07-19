class ApplicantPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @applicant = model
  end

  # You cannot list all applicants unless you are an admin
  def index?
    @current_user.admin?
  end

  # Unless you are a job seeker you cannot apply
  def create?
    !@current_user.admin?
  end

  # You cannot read a job application unless you are an admin
  def show?
    @current_user.admin?
  end

  # Unless you are a job seeker you cannot see the list of the jobs you applied for
  def by_user?
    !@current_user.admin?
  end
end
