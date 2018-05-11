require 'rails_helper'

RSpec.describe Api::TasksController, type: :controller do
    before(:each) do
        allow_message_expectations_on_nil
    end

    let(:group) { Group.create!(name: 'Errands') }
    let(:task) { Task.create!(name: 'Go to the Bank', completed_at: nil, group_id: group.id) }
    let (:today) { Date.today }
    describe 'GET #show' do
        it 'renders the task as json' do
            get :show, params: { id: task.id }
            expect(response.content_type).to eq("application/json")
            expect(JSON.parse(response.body)['name']).to eq('Go to the Bank')
            expect(JSON.parse(response.body)['group_id']).to eq(group.id)
            expect(response).to have_http_status(200)
        end

        it 'http status as 404 not found when task does not exist' do
            get :show, params: { id: 65 }
            expect(JSON.parse(response.body)['errors']).to eq("Task not found")
            expect(response).to have_http_status(404)
        end
    end

    describe 'POST #create' do

        it 'renders the task as json' do
            post :create, params: {task: { name: 'Go to the Bank', completed_at: today, group_id: group.id  } }
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
            expect(JSON.parse(response.body)['name']).to eq('Go to the Bank')
            date = JSON.parse(response.body)['completed_at']
            expect(Date.parse(date)).to eq(today)
        end

        it 'validates group_id exists' do
            post :create, params: {task: { name: 'Go to the Bank' } }
            expect(response.content_type).to eq("application/json")
            expect(flash[:errors]).to eq(['Group must exist'])
            expect(response).to have_http_status(422)
        end
    end

    # describe 'GET #index' do 
    #     it 'renders task index as json' do 
    #         get :index
    #         expect(response).to render_template("index")
    #         expect(response).to have_http_status(200)
    #     end 
    # end 

    # describe 'POST #update' do
    #     it 'updates a task' do
    #         put :update, params: {task: { name: 'Go to the Bank!', id: task.id} }
    #         expect(response.content_type).to eq("application/json")
    #         expect(response).to have_http_status(200)
    #         expect(JSON.parse(response.body)['name']).to eq('Go to the Bank!')
    #     end
    # end
end

