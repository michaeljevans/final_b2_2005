require 'rails_helper'

RSpec.describe Flight do
  describe 'relationships' do
    it { should belong_to :airline }
  end

  describe 'validations' do
    it { should validate_presence_of :number }
  end
end
