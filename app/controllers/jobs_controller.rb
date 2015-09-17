class JobsController < ApplicationController
  before_action :set_collections, only: [:new, :create]

  def index
    @jobs = Job.all
    @companies = Company.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new

  end

  def create
    @job = Job.new(job_params)
    if(@job.save)
      redirect_to @job
    else
      flash[:error] = "Warning! All fields are mandatory."
      render 'new'
    end
  end

  private
  def set_collections
    @companies = Company.all
    @categories = Category.all
  end

  def job_params
    params.require(:job).permit(:title, :location, :category_id, :company_id, :description, :featured)
  end
end
