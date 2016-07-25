require('spec_helper')

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }

  it { should validate_presence_of(:name) }
end
