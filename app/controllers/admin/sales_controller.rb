class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to admin_sales_path, notice: 'You added a new promotion!'
    else
      render :new
    end
  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: 'Promotion deleted!'
  end

  private
    def sale_params
      params.require(:sale).permit(:name, :starts_on, :ends_on, :percent_off)
    end
end

