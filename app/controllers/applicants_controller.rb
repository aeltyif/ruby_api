class ApplicantsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_applicant, only: [:show]
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @job = Job.where(job_id: params[:job_id], user_id: current_user.id)
    if @job
      @applicants = Applicant.where(job_id: params[:job_id])
      json_response(@applicants)
    else
      json_response(@job, :unprocessable_entity)
    end
  end

  def create
    @applicant = Applicant.create!(user_id: current_user.id, job_id: params[:job_id])
    json_response(@applicant, :created)
  end

  def show
    if !@applicant.seen
      @applicant.update(seen: 1)
    end
    json_response(@applicant)
  end

  def by_user
    @user_applications = Applicant.where(user_id: current_user.id)
    json_response(@user_applications)
  end

  private

  def set_applicant
    @applicant = Applicant.find(params[:id])
  end
end
