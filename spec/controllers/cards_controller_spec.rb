# frozen_string_literal: true

require 'rails_helper'
describe CardsController do

  describe 'GET #show' do
    subject { get :show, params: { id: card.id, project_id: project.id } }

    let(:project) { create(:project) }
    let!(:card) { create(:card, project: project)}

    it 'assigns @cards' do
      subject
      expect(assigns(:card)).to eq(card)
    end

    it 'renders the show template' do
      subject
      expect(response).to render_template('show')
    end
  end

  describe 'POST create' do
    subject do
      post :create,
           params: { project_id: project.id, card: { content: "foo bar baz", status: "Backlog" }}
    end

    let(:project) { create(:project) }

      it 'creates a card' do
        expect { subject }.to change { Card.count }.by(1)
      end

      it 'has the correct content' do
        subject
        expect(Card.last.content).to eq('foo bar baz')
      end

      it 'has the correct status' do
        subject
        expect(Card.last.status).to eq('Backlog')
      end

      it "redirects to the projects show page" do
        expect(subject).to redirect_to(project_url(project))
      end
    end
end