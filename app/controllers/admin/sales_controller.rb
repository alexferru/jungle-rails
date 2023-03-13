class Admin::SalesController < ApplicationController
  # http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def created
    @sale = Sale.new(sale_params)
    if @sale.valid?
      redirect_to admin_sales, notice: 'You added a new promotion!'
    else
      redirect_to new_admin_sale
    end
  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: 'Promotion deleted!'
  end

  private
    def sale_params
      params.require(:sale).permit(:name, :start_date, :end_date, :percent_off)
    end
end
