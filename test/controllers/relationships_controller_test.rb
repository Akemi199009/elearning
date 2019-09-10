require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get relationships_create_url
    assert_response :success
  end

<<<<<<< Updated upstream
  test "should get destroy" do
    get relationships_destroy_url
=======
  test "should get destro" do
    get relationships_destro_url
>>>>>>> Stashed changes
    assert_response :success
  end

end
