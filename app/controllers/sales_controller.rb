class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def import
    Sale.import(params[:file])

    flash[:success] = "Data successfully imported"
    redirect_to root_url
  end
end
