require 'rails_helper'

RSpec.describe SheetsController, type: :controller do

  describe 'GET #index' do
    let(:sheet) { create :sheet }

    it 'returns a success response' do
      get :index
      expect(assigns(:sheets).count).to eq 1
      expect(assigns(:sheets)).to eq [sheet]
    end
  end
end
