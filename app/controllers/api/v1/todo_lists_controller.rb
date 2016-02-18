class Api::V1::TodoListsController < ApplicationController
  def index
    render json: TodoList.all
  end

  def show
    render json: TodoList.find(params[:id])
  end

  def create
    todo_list = TodoList.new(todo_list_params)
    todo_list.save
    render json: todo_list
  end

  def update
    todo_list = TodoList.find(params[:id])
    todo_list.update(todo_list_params)
    render json: todo_list
  end

  def destroy
    todo_list = TodoList.find(params[:id])
    todo_list.destroy
    render nothing: true
  end


  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :user_id)
  end
end
