class Api::V1::TodoListsController < ApplicationController
  def index
    render json: current_user.todo_lists
  end

  def show
    todo_list = TodoList.find(params[:id])
    if current_user.todo_lists.include? todo_list
      render json: todo_list
    else
      render nothing: true
    end
  end

  def create
    todo_list = TodoList.new(todo_list_params)
    todo_list.save
    render json: todo_list
  end

  def update
    todo_list = TodoList.find(params[:id])
    if current_user.todo_lists.include? todo_list
      todo_list.update(todo_list_params)
      render json: todo_list
    else
      render nothing: true
    end
  end

  def destroy
    todo_list = TodoList.find(params[:id])
    if current_user.todo_lists.include? todo_list
      todo_list.destroy
    end
    render nothing: true
  end



  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :user_id)
  end
end
