class TasksController < ApplicationController

  def create
    @todo = Todo.find(params[:todo_id])
    @task = @todo.tasks.new(params[:task])
    if @task.save
      flash[:notice] = "Task added"
      redirect_to(todo_url(@todo))
    else
      flash[:notice] = "There was an error, task item was not saved."
      redirect_to(todo_url(@todo))
    end
  end

  def update
    @todo = Todo.find(params[:todo_id])
    @task = Task.find(params[:id])
    if @task.update_attributes(complete: !@task.complete)
      respond_to do |format|
        format.html { redirect_to todo_url(@todo) }
        format.js   { render :nothing => true }
      end
    else
      flash[:warning] = "Error: Your task could not be completed"
      redirect_to todo_url(@todo)
    end
  end

  def destroy
    @todo = Todo.find(params[:todo_id])
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Your task has been deleted"
      respond_to do |format|
        format.html { redirect_to todo_url(@todo) }
        format.js   { render :nothing => true }
      end
    else
      flash[:notice] = "Error: Your task could not be deleted"
      redirect_to todo_url(@todo)
    end
  end
end
