require 'test_helper'

class TeachersBackoffice::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get teachers_backoffice_welcome_index_url
    assert_response :success
  end

end
