require 'spec_helper_acceptance'

describe 'ubuntuzilla class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    # rubocop:disable RSpec/MultipleExpectations
    it 'works with no errors' do
      pp = <<-EOS
      class { 'ubuntuzilla': }
      EOS

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).not_to eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end
    # rubocop:enable RSpec/MultipleExpectations
  end
end
