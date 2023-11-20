# frozen_string_literal: true

require 'rails_helper'
describe ManageUsersController do
  
  before do
    login_user current_user
    allow(controller).to receive(:current_user).and_return(current_user)
  end
  
  let!(:current_user) { create(:user) }

  describe "GET #index" do 
    it "assigns @users" do
      get :index
      expect(assigns(:users)).to eq([current_user])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end