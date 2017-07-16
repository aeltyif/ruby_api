class JobsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_job, only: [:show, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @jobs = Job.all
    json_response(@jobs)
  end

  def create
    # Plug the current authenticated user
    jp = job_params
    jp[:user_id] = current_user.id
    @job = Job.create!(jp)
    json_response(@job, :created)
  end

  def show
    json_response(@job)
  end

  def update
    @job.update(job_params)
    head :no_content
  end

  def destroy
    @job.destroy
    head :no_content
  end

  private

  def job_params
    params.permit(:title, :body)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
