require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should belong_to(:question) }
  it { should belong_to(:user) }
  it { should have_valid(:description).when("X" * 50) }
  it { should_not have_valid(:description).when("turn it off and on again") }
end
