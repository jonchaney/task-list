class Api::TasksController < ApplicationController
    def show
        @task = Task.find(params[:id])
        render json: @task
    end
    
      def create
        @task = Task.new(task_params)
        p @task
        if @task.save
          render json: @task
        else
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
          flash.now[:errors] = @link.errors.full_messages
          render json: @task.errors.full_messages, status: 422
        end
      end
    
      def destroy
        @task = Task.find(params[:id])
        if @task
          @task.destroy
          render json: ['success']
        else
          flash.now[:errors] = @link.errors.full_messages
          render json: ['error'], status: 404
        end
      end
    
      private
    
      def task_params
        params.permit(:name, :completed_at)
      end
end
