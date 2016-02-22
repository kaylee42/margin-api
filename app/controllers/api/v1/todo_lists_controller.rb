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
    if todo_list.save
      render json: todo_list
    else
      render json: {errors: todo_list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    todo_list = TodoList.find(params[:id])
    if current_user.todo_lists.include? todo_list
      if todo_list.update(todo_list_params)
        render json: todo_list
      else
        render json: {errors: todo_list.errors.full_messages}, status: :unprocessable_entity
      end
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
