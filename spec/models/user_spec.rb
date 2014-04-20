require 'spec_helper'

describe User do

  it { should have_secure_password }
  # it { should ensure_length_of(:password).is_at_least(8).is_at_most(16) }
  it { should validate_confirmation_of(:password) }

  it { should validate_presence_of(:name) }

  it "must have a unique email" do
    user = User.create(name: "user", email: "user@user.com", password: "abcd1234", password_confirmation: "abcd1234")
    expect( user ).to validate_uniqueness_of(:email)
  end

end