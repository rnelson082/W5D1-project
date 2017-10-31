require 'rails_helper'


RSpec.describe User, type: :model do

  subject(:user) do
    FactoryBot.create(:user, username:'Lebron', password:'password')
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:session_token) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6).on(:create) }

  describe "password encryption is set" do
    it "creates a password digest when a password is given" do
      expect(user.password_digest).to_not be_nil
    end

    it "makes sure the given password is valid" do
      expect(user.valid_password?(user.password)).to be true
    end
  end

  describe "session tokens are assigned correctly" do
    it "makes...i dunno, like... the session happen and shit" do
      user.ensure_session_token
      expect(user.session_token).to_not be_nil
    end

    it "see if resetting the sesssion token is indeed different than the original" do
      old_session = user.ensure_session_token
      new_session = user.reset_session_token
      expect(old_session == new_session).to be false
    end

    # before { user.save! }

    it "makes sure we can find the correct user when logging in" do
      user = FactoryBot.create(:user, username:'Lebron', password:'password')
      found_user = User.find_by_credentials('Lebron','password')
      expect(user == found_user).to be true
    end
  end

end
