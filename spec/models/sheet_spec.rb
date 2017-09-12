require 'rails_helper'

RSpec.describe Sheet, type: :model do

  context 'check validations' do
    context 'when valid' do
      it 'has valid factory' do
        expect(build :sheet).to be_valid
      end
    end

    context 'when invalid' do
      it 'has empty attrs' do
        expect(build(:invalid_sheet)).to_not be_valid
      end
    end
  end
end
