class Api::TasksController < ApplicationController
    def show
        @task = Task.find_by(id: params[:id])
        if @task
          render json: @task
        else 
          render json: { errors: "Task not found" }, status: 404
        end
    end
    
    def create
      @task = Task.new(task_params)
      if @task.save
        render json: @task
      else
        flash.now[:errors] = @task.errors.full_messages
        render json: @task.errors.full_messages, status: 422
      end
    end
  
    def index
      @tasks = Task.all
      # send to app/views/api/tasks/index.json.jbuilder to render requested payload slice
      render :index
    end
  
    def update
      @task = Task.find(params[:id])
      if @task.update_attributes(task_params)
        render json: @task
      else
        flash.now[:errors] = @task.errors.full_messages
        render json: @task.errors.full_messages, status: 422
      end
    end
  
    def destroy
      @task = Task.find(params[:id])
      if @task
        @task.destroy
        render json: ['success']
      else
        flash.now[:errors] = @task.errors.full_messages
        render json: ['error'], status: 404
      end
    end
  
    private
  
    def task_params
      params.require(:task).permit(:name, :completed_at, :group_id, :id)
    end
end
