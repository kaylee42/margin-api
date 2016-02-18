class Api::V1::TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def show
    render json: Todo.find(params[:id])
  end

  def create
    todo = Todo.new(todo_params)
    todo.save
    render json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(todo_params)
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    render nothing: true
  end


  private

  def todo_params
    params.require(:todo).permit(:title, :description, :aasm_state, :dude_date, :todo_list_id, :sheet_list_id)
  end
end
