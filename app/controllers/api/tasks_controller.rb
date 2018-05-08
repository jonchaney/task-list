class Api::TasksController < ApplicationController
    def show
        @task = Task.find(params[:id])
        render json: @task
    end
    
      def create
        @task = Task.new(task_params)
        if @task.save
          render json: @task
        else
          render json: @task.errors.full_messages, status: 422
        end
      end
    
      def index
        @tasks = Task.all
        render :index
      end
    
      def update
        @task = Task.find(params[:id])
        if @task.update_attributes(task_params)
          render json: @task
        else
          render json: @task.errors.full_messages, status: 422
        end
      end
    
      def destroy
        @task = Task.find(params[:id])
    
        if @task
          @task.destroy
          render json: ['success']
        else
          render json: ['error'], status: 404
        end
      end
    
      private
    
      def task_params
        params.permit(:name, :completed_at)
      end
end
