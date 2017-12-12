class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def import
    if params[:file]
      Sale.import(params[:file])

      flash[:success] = "Data successfully imported"
    else
      flash.now[:danger] = "Please, inform a file"

      render 'new'
    end
  end
end
