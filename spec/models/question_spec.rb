require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should have_many(:answers) }
  it { should belong_to(:user) }
  it { should have_valid(:title).when("This is a valid title for a question. Please help.") }
  it { should_not have_valid(:title).when(nil, "", "idk...") }
  it { should have_valid(:description).when("X" * 150) }
  it { should_not have_valid(:description).when("Stuff is broke.") }
end
