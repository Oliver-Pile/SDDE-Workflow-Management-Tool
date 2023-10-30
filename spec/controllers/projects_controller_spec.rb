# frozen_string_literal: true

require 'rails_helper'
describe ProjectsController do

  describe 'GET #index' do
    let!(:project) { create(:project) }

    it 'assigns @kanbans' do
      get :index
      expect(assigns(:projects)).to eq([project])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    subject do
      post :create,
           params: { project: {title: "title", description: "description!", department: "Ops" }}
    end

      it 'creates a project' do
        subject
        expect(Project.count).to be(1)
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
