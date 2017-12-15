class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def import
    if params[:file]
      @total_imported_value = SalesImporter.importer(params[:file])

      render 'result'
    else
      flash.now[:danger] = "Please, inform a file"

      render 'new'
    end
  end
end
