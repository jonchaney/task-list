require 'rails_helper'

RSpec.describe Api::TasksController, type: :controller do
    before(:each) do
        allow_message_expectations_on_nil
    end

    let(:group) { Group.create!(name: 'Errands') }
    let(:task) { Task.create!(name: 'Go to the Bank', completed_at: nil, group_id: group.id) }

    describe 'GET #show' do
        it 'renders the task as json' do
            get :show, params: { id: task.id }
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
        end

        it 'http status as 404 not found when task does not exist' do
            get :show, params: { id: 65 }
            expect(response).to have_http_status(404)
        end
    end

    describe 'POST #create' do
        it 'renders the task as json' do
            post :create, params: {task: { name: 'Go to the Bank', completed_at: nil, group_id: group.id  } }
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
            expect(JSON.parse(response.body)['name']).to eq('Go to the Bank')
        end

        it 'validates group_id exists' do
            post :create, params: {task: { name: 'Go to the Bank' } }
            expect(response.content_type).to eq("application/json")
            expect(flash[:errors]).to eq(['Group must exist'])
            expect(response).to have_http_status(422)
        end
    end

    describe 'GET #index' do 
        it 'renders task index as json' do 
            
        end 

    end 


    
end

