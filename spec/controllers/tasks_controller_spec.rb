require 'rails_helper'

RSpec.describe Api::TasksController, type: :controller do
    context 'with invalid params' do
        it 'validates the presence of name' do
            post :create, params: { name: nil }
            expect(response.content_type).to eq("application/json") 
            expect(response).to have_http_status(422)
        end
      end
      
      context 'with valid params' do
        it 'renders json and responds with status 200' do
            post :create, params: { name: 'Go to the beach' }
            expect(response.content_type).to eq("application/json") 
            expect(response).to have_http_status(200)
        end
      end
end
