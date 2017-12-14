class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def import
    Sale.import(params[:file])
    @sales = Sale.all
    @total_imported_value = Sale.total_imported_value


    flash[:success] = "Data successfully imported"
    render 'result'
  end
end
