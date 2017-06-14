require 'test_helper'

class Devise::UncommonPassword::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Devise::UncommonPassword
  end

  test "should deny validation for a common password" do
    msg = "Chosen password is common and easy for hackers to guess. Please choose a unique password."
    password = common_passwords.first
    user = User.create email:"example@example.org", password: password, password_confirmation: password
    assert_not user.valid?, "User with common password shoud not be valid."
  end

  test "should accept validation for an uncomm password" do
    password = "fddkasnsdddghjt"
    user = User.create email:"example@example.org", password: password, password_confirmation: password
    assert user.valid?, "User with uncommon password should be valid."
  end
end
