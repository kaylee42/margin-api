class Api::V1::NotebooksController < ApplicationController
  def index
     
    render json: Notebook.all
  end

  def show

    render json: Notebook.find(params[:id])
  end

  def create

    notebook = Notebook.new(notebook_params)
    notebook.save
    render json: notebook
  end

  def update

    notebook = Notebook.find(params[:id])
    notebook.update(notebook_params)
    render json: notebook
  end

  def destroy

    notebook = Notebook.find(params[:id])
    notebook.destroy
    render nothing: true
  end


  private

  def notebook_params
    params.require(:notebook).permit(:title, :description)
  end
end
