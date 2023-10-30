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

end