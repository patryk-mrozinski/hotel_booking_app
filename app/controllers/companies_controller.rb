module Company
  class CompaniesController < BaseController
    before_action :authenticate_user!
    before_action :set_company, only: %i(show edit update destroy)

    layout 'for_company'

    def index
      @companies = current_user.companies
    end

    def show; end

    def new
      @company = current_user.companies.build
    end

    def create
      @company = current_user.companies.build(company_params)

      if @company.save
        redirect_to @company
        if current_user.has_company == false
          current_user.has_company.toggle(company)
        end
      else
        render :new
      end
    end

    def edit; end

    def update
      if @company.update(company_params)
        redirect_to @company
      else
        render :edit
      end
    end

    def destroy
      @company.destroy
      redirect_to companies_path
    end

    private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :p_number, :company_serial, :address, :company_email, user_ids: [])
    end
  end
end
