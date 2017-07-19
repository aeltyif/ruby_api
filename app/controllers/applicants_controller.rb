class ApplicantsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_applicant, only: [:show]
  before_action :authenticate_user!
  after_action  :verify_authorized

  # View all the applicants for your job post
  def index
    authorize Applicant
    if Job.where(id: params[:job_id], user_id: current_user.id).present?
      @applicants = Applicant.where(job_id: params[:job_id])
      json_response(@applicants)
    else
      head :unprocessable_entity
    end
  end

  # Apply for a job application
  def create
    authorize Applicant
    @applicant = Applicant.create!(user_id: current_user.id, job_id: params[:job_id])
    json_response(@applicant, :created)
  end

  # Show the application for the job owner, and mark it as seen
  def show
    authorize Applicant
    if Job.where(id: @applicant.job_id, user_id: current_user.id).present?
      if !@applicant.seen
        @applicant.update(seen: 1)
      end
      json_response(@applicant)
    else
      head :unprocessable_entity
    end
  end

  # Show the list of jobs the job seeker applied to
  def by_user
    authorize Applicant
    @user_applications = Applicant.where(user_id: current_user.id)
    json_response(@user_applications)
  end

  private
  # Get applicant by id
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end
end
