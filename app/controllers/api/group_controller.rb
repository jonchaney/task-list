class Api::GroupController < ApplicationController
    def show
        @group = Group.find(params[:id])
    end
    
      def create
        @group = Group.new(group_params)
        if @group.save
          render 'api/groups/show'
        else
          render json: @group.errors.full_messages, status: 422
        end
      end
    
      def index
        @groups = Group.all
        render :index
      end
    
      def update
        @group = Group.find(params[:id])
        if @group.update_attributes(group_params)
          render :show
        else
          render json: @group.errors.full_messages, status: 422
        end
      end
    
      def destroy
        @group = Group.find(params[:id])
    
        if @group
          @group.destroy
          render json: ['success']
        else
          render json: ['error'], status: 404
        end
      end
    
      private
    
      def group_params
        params.require(:group).permit(:name, :completed_at)
      end
end
