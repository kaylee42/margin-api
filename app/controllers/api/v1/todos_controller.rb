class Api::V1::TodosController < ApplicationController
  def index
    render json: current_user
  end

  def show
    todo = Todo.find(params[:id])
    if current_user.todos.include? todo
      render json: todo
    else
      render nothing: true
    end
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: {errors: todo.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])
    if current_user.todos.include? todo
      if todo.update(todo_params)
        render json: todo
      else
        render json: {errors: todo.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render nothing: true
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    if current_user.todos.include? todo
      todo.destroy
    end
    render nothing: true
  end



  private

  def todo_params
    params.require(:todo).permit(:title, :description, :aasm_state, :dude_date, :todo_list_id, :sheet_list_id)
  end
end
