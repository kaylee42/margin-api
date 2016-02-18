class Api::V1::SheetsController < ApplicationController
    def index
      render json: Sheet.all
    end

    def show
      render json: Sheet.find(params[:id])
    end

    def create
      sheet = Sheet.new(sheet_params)
      sheet.save
      render json: sheet
    end

    def update
      sheet = Sheet.find(params[:id])
      sheet.update(sheet_params)
      render json: sheet
    end

    def destroy
      sheet = Sheet.find(params[:id])
      sheet.destroy
      render nothing: true
    end


    private

    def sheet_params
      params.require(:sheet).permit(:title, :content)
    end
  end

end
