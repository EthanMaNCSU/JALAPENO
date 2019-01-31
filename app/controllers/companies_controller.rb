class CompaniesController < ApplicationController
  def new
    @company=Company.new
  end
  def index
    @companies = Company.paginate(page: params[:page])
  end
  def show
    @company = Company.find(params[:id])
  end


def edit
  @company = Company.find(params[:id])
end

def create
  @company=Company.new(company_params)
  if @company.save
    redirect_to @company
  else
    render 'new'
  end
end

def update
  @company = Company.find(params[:id])
  if @company.update_attributes(company_params)
    flash[:success] = "Company information updated"
    redirect_to @company
  else
    render 'new'
  end
end

def destroy
  Company.find(params[:id]).destroy
  flash[:success] = "Company deleted"
  redirect_to companies_url
end

private
def company_params
  params.require(:company).permit(:name,:website,:headquarters,:size,:founded,:industry,:revenue,:synopsis)
end

end

