class JobsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_job, only: [:show, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]
  after_action  :verify_authorized, :except => [:index, :show]

  # This will show all the available jobs
  def index
    @jobs = Job.all
    json_response(@jobs)
  end

  # Create a job post
  def create
    authorize Job
    jp = job_params
    jp[:user_id] = current_user.id
    @job = Job.create!(jp)
    json_response(@job, :created)
  end

  # Show a job post
  def show
    json_response(@job)
  end

  # Update a job post
  def update
    authorize @job
    @job.update(job_params)
    head :no_content
  end

  # Delete a job post
  def destroy
    authorize @job
    @job.destroy
    head :no_content
  end

  private

  # The allowed feilds to be sent
  def job_params
    params.permit(:title, :body)
  end

  # Get a job post by id
  def set_job
    @job = Job.find(params[:id])
  end
end
