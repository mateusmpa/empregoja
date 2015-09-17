class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    redirect_to @company
  end

  def show
    @company = Company.find(params[:id])
    #@jobs = Job.where(company: params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :phone, :mail)
  end
end
