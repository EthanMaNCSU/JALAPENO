require 'test_helper'

class RecruiterTest < ActiveSupport::TestCase
  def setup
    @recruiter  = Recruiter.new(name: "Example User", email: "user666@example.com", password: "foobar", password_confirmation: "foobar")
  end
  test "should be valid" do
    assert @recruiter.valid?
  end

  test "name should be present" do
    @recruiter.name = "     "
    assert_not @recruiter.valid?
  end

  test "email should be present" do
    @recruiter.email = "     "
    assert_not @recruiter.valid?
  end

  test "name should not be too long" do
    @recruiter.name = "a" * 51
    assert_not @recruiter.valid?
  end

  test "email should not be too long" do
    @recruiter.email = "a" * 244 + "@example.com"
    assert_not @recruiter.valid?
  end
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @recruiter.email = valid_address
      assert @recruiter.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @recruiter.email = invalid_address
      assert_not @recruiter.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test "email addresses should be unique" do
    duplicate_user = @recruiter.dup
    duplicate_user.email=@recruiter.email.upcase
    @recruiter.save
    assert_not duplicate_user.valid?
  end
  test "email addresses should be saved as lower-case" do
    mixed_case_email="Foo@ExAMPle.CoM"
    @recruiter.email=mixed_case_email
    @recruiter.save
    assert_equal mixed_case_email.downcase, @recruiter.reload.email
  end

  test "password should be present" do
    @recruiter.password=@recruiter.password_confirmation = " "*6
    assert_not @recruiter.valid?
  end
  test "password should have a minimum length" do
    @recruiter.password = @recruiter.password_confirmation = "a" * 5
    assert_not @recruiter.valid?
  end
end
