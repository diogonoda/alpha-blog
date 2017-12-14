class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def import
    if params[:file]
      Sale.import(params[:file])
      @total_imported_value = Sale.total_imported_value

      flash[:success] = "Data successfully imported"
      render 'result'
    else
      flash.now[:danger] = "Please, inform a file"

      render 'new'
    end
  end
end
