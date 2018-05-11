require 'rails_helper'

RSpec.describe Api::GroupsController, type: :controller do
    before(:each) do
        allow_message_expectations_on_nil
    end

    let(:group) { Group.create!(name: 'Errands') }

    describe 'GET #show' do
        it 'renders the group as json' do
            get :show, params: { id: group.id }
            expect(response.content_type).to eq("application/json")
            expect(JSON.parse(response.body)['name']).to eq('Errands')
            expect(response).to have_http_status(200)
        end

        it 'http status as 404 not found when group does not exist' do
            get :show, params: { id: 65 }
            expect(JSON.parse(response.body)['errors']).to eq("Group not found")
            expect(response).to have_http_status(404)
        end
    end

    describe 'POST #create' do

        it 'creates and renders the group as json' do
            post :create, params: {group: { name: 'Purchases' } }
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
            expect(JSON.parse(response.body)['name']).to eq('Purchases')
        end
    end
end
