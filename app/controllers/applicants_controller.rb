class ApplicantsController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :set_applicant, only: [:show, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  def index
    @applicants = Applicant.all
    json_response(@applicants)
  end

  def create
    @applicant = Applicant.create!(user_id: current_user.id, job_id: params[:job_id])
    json_response(@applicant, :created)
  end

  def show
    if !@ applicant.seen
      @applicant.update(seen: 1)
    end
    json_response(@applicant)
  end

  private
  def set_applicant
    @applicant = Applicant.find(params[:id])
  end
end
