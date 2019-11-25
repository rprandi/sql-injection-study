require 'test_helper'

class TesteControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get teste_show_url
    assert_response :success
  end

end
