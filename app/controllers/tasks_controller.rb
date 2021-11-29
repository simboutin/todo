class TasksController < ApplicationController
  def index
    @tasks = Task.where(user: current_user).ordered_by_default
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.done
      @task.update(done: false)
    else
      @task.update(done: true)
    end
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
