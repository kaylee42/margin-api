class Api::V1::SheetsController < ApplicationController
    def index
      render json: current_user.sheets
    end

    def show
      sheet = Sheet.find(params[:id])
      if current_user.sheets.include? sheet
        render json: sheet
      else
        render nothing: true
      end
    end

    def create
      sheet = Sheet.new(sheet_params)
      if sheet.save
        notebook = Notebook.find(params[:sheet][:notebookid])
        NotebookSheet.create(sheet: sheet, notebook: notebook)
        render json: sheet
      else
        render json: {errors: sheet.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def update
      sheet = Sheet.find(params[:id])
      if current_user.sheets.include? sheet
        if sheet.update(sheet_params)
          render json: sheet
        else
          render json: {errors: sheet.errors.full_messages}, status: :unprocessable_entity
        end
      else
        render nothing: true
      end
    end

    def destroy
      sheet = Sheet.find(params[:id])
      if current_user.sheets.include? sheet
        sheet.destroy
      end
      render nothing: true
    end



    private

    def sheet_params
      params.require(:sheet).permit(:title, :content)
    end


end
