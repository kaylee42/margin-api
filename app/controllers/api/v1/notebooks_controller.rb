class Api::V1::NotebooksController < ApplicationController
  def index
    render json: current_user.notebooks
  end

  def show
    notebook = Notebook.find(params[:id])
    if current_user.notebooks.include? notebook
      render json: notebook
    else
      render nothing: true
    end
  end

  def create
    notebook = Notebook.new(notebook_params)
    if notebook.save
      NotebookUser.create(notebook: notebook, user: current_user)
      sheet = Sheet.create(title: "Untitled")
      NotebookSheet.create(notebook: notebook, sheet: sheet)
      render json: notebook
    else
      render json: {errors: notebook.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    notebook = Notebook.find(params[:id])
    if current_user.notebooks.include? notebook
      if notebook.update(notebook_params)
        render json: notebook
      else
        render json: {errors: notebook.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render nothing: true
    end
  end

  def destroy
    notebook = Notebook.find(params[:id])
    if current_user.notebooks.include? notebook
      notebook.destroy
    end
    render nothing: true
  end


  private

  def notebook_params
    params.require(:notebook).permit(:title, :description)
  end
end
