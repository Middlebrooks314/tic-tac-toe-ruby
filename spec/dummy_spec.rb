require 'spec_helper'
require_relative '../lib/dummy'

describe 'foo' do
  it('does what foo should do') do
    expect(foo).to eq('foo')
  end
end
