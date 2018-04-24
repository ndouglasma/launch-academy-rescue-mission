require 'rails_helper'

# RSpec.describe User, type: :model do
#   it { should have_many(:questions) }
#   it { should have_many(:answers) }
#   it { should have_valid(:name).when("radavis", "dpickett", "dreamingfurther") }
#   it { should_not have_valid(:name).when(nil, "") }
#   it { should have_valid(:uid).when(1234, "asdf4321") }
#   it { should_not have_valid(:uid).when(nil, "") }
#   it { should have_valid(:provider).when("twitter", "github", "facebook") }
#   it { should_not have_valid(:provider).when(nil, "", "pinterest") }
#   it { should have_valid(:image_url).when("http://imgur.com/45983.png") }
#   it { should_not have_valid(:image_url).when(nil, "", "asdf") }
# end

RSpec.describe User, :type => :model do
  before(:all) do
    @user1 = create(:user)
  end

  it "is valid with valid attributes" do
    expect(@user1).to be_valid
  end

  it "has a unique username" do
    user2 = build(:user, name: "Nisha Douglas 1")
    expect(user2).to_not be_valid
  end
end
