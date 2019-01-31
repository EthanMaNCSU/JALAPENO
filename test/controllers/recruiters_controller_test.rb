require 'test_helper'

class RecruitersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @recruiter = recruiters(:michael)
    @other_recruiter = recruiters(:archer)
  end
  test "should get new" do
    get signup_recruiter_path
    assert_response :success
  end
  test "should redirect edit when not logged in" do
    get edit_recruiter_path(@recruiter)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should redirect update when not logged in" do
    patch recruiter_path(@recruiter), params: { recruiter: { name: @recruiter.name,
                                              email: @recruiter.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_recruiter)
    get edit_recruiter_path(@recruiter)
    assert_redirected_to login_url
  end
  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_recruiter)
    patch recruiter_path(@recruiter), params: { recruiter: { name: @recruiter.name,
                                              email: @recruiter.email } }
    assert_redirected_to login_url
  end
  test "should redirect index when not logged in" do
    get recruiters_path
    assert_redirected_to login_url
  end
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Recruiter.count' do
      delete recruiter_path(@recruiter)
    end
    assert_redirected_to root_url
  end
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_recruiter)
    assert_no_difference 'Recruiter.count' do
      delete recruiter_path(@recruiter)
    end
    assert_redirected_to root_url
  end
end
