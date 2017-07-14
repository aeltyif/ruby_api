class JobsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_job, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /jobs
  def index
    @jobs = Job.all
    json_response(@jobs)
  end

  # POST /jobs
  def create
    # Plug the current authenticated user
    jp = job_params
    jp[:user_id] = 1
    @job = Job.create!(jp)
    json_response(@job, :created)
  end

  # GET /jobs/:id
  def show
    json_response(@job)
  end

  # PUT /jobs/:id
  def update
    @job.update(job_params)
    head :no_content
  end

  # DELETE /jobs/:id
  def destroy
    @job.destroy
    head :no_content
  end

  private

  def job_params
    # whitelist params
    params.permit(:title, :body)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
