class Api::GroupsController < ApplicationController
    def show
      @group = Group.find_by(id: params[:id])
      if @group
        render json: @group
      else 
        render json: { errors: "Group not found" }, status: 404
      end
    end
    
    def create
      @group = Group.new(group_params)
      if @group.save
        render json: @group
      else
        flash.now[:errors] = @group.errors.full_messages
        render json: @group.errors.full_messages, status: 422
      end
    end
    
      def index
        @groups = Group.all
        render json: @groups
      end
    
      def update
        @group = Group.find(params[:id])
        if @group.update_attributes(group_params)
          render json: @group
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
        params.require(:group).permit(:name, :id)
      end
end
