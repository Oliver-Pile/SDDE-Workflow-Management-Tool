# frozen_string_literal: true

require 'rails_helper'
describe ProjectsController do
  before do
    login_user current_user
    allow(controller).to receive(:current_user).and_return(current_user)
  end
  let!(:current_user) { create(:user) }
  let!(:project) { create(:project) }

  describe 'GET #index' do
    it 'assigns @projects' do
      get :index
      expect(assigns(:projects)).to eq([project])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let!(:card) { create(:card, project: project)}
    subject { get :show, params: { id: project.id } }

    it 'assigns @cards' do
      subject
      expect(assigns(:cards)).to eq([card])
    end

    it 'assigns @project' do
      subject
      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'POST create' do
    subject do
      post :create,
           params: { project: {title: "title", description: "description!", department: "Ops" }}
    end

      it 'creates a project' do
        expect { subject }.to change { Project.count }.by(1)
      end

      it 'has the correct title' do
        subject
        expect(Project.last.title).to eq('title')
      end

      it 'has the correct description' do
        subject
        expect(Project.last.description).to eq('description!')
      end

      it 'has the correct department' do
        subject
        expect(Project.last.department).to eq('Ops')
      end

      it "redirects to the projects index page" do
        expect(subject).to redirect_to(project_url(Project.last))
      end
    end

    describe 'PATCH update' do
      subject do
        put :update, params: { id: project.id, project: { title: 'foo', description: 'bar', department: 'baz' } }
      end

      let!(:project) { create(:project) }

      it 'updates the title of the project' do
        expect { subject }.to change { project.reload.title }.to('foo')
      end

      it 'updates the description of the project' do
        expect { subject }.to change { project.reload.description }.to('bar')
      end

      it 'updates the department of the project' do
        expect { subject }.to change { project.reload.department }.to('baz')
      end
    end
end
