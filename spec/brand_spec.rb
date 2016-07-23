require('spec_helper')
require('shoulda-matchers')

describe(Brand) do
  it { should have_many(:stores) }
end
