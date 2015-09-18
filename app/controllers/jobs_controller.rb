class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update]
  before_action :set_collections, only: [:index, :new, :edit]
  def index
    @jobs = Job.all
  end

  def show
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
      @companies = Company.all
      @categories = Category.all
      render 'new'
    end
  end

  def edit
  end

  def update
    @job.update(job_params)
    redirect_to @job
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def set_collections
    @companies = Company.all
    @categories = Category.all
  end

  def job_params
    params.require(:job).permit(:title, :location, :category_id, :company_id, :description, :featured)
  end
end
