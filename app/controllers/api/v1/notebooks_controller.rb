class Api::V1::NotebooksController < ApplicationController
  def index
    render json: Notebook.all
  end
end
