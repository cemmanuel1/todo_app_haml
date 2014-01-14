class  TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def create
    @todo = Todo.new params[:todo]
    if @todo.save
      flash[:notice] = "Todo Created"
      respond_to do |format|
        format.html { redirect_to todo_url(@todo) }
        format.js
      end
    else
      flash[:warning] = "Error: Your Todo Was Not Created"
      render :index
    end
  end

  def show
    @todo = Todo.find(params[:id])
    @task = @todo.tasks.new
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:notice] = "Your todo has been deleted"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js   { render :nothing => true }
      end
    else
      flash[:warning] = "Error: Your todo could not be deleted"
      redirect_to root_path
    end
  end
end
