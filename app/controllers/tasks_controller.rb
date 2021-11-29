class TasksController < ApplicationController
  def index
    case params[:order]
    when 'due_date_asc' then @tasks = Task.where(user: current_user).order(due_date: :asc)
    when 'due_date_desc' then @tasks = Task.where(user: current_user).order(due_date: :desc)
    when 'status_not_done' then @tasks = Task.where(user: current_user).order(done: :asc)
    when 'status_done' then @tasks = Task.where(user: current_user).order(done: :desc)
    else
      @tasks = Task.where(user: current_user).ordered_by_default
    end
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
