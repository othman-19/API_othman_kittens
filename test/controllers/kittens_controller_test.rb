require 'test_helper'

class KittensControllerTest < ActionDispatch::IntegrationTest
  def setup
    @kitten = Kitten.create(name: "catname", age: 2, cuteness: "very cute", softness: "very soft")
  end

  test "should get index" do
    get kittens_url
    assert_response :success
  end

  def test_new
    get new_kitten_url
    assert_response 200
    assert_template "kittens/new"
    assert_template layout: "layouts/application", partial: "_form"  end

  
  test "should show kitten" do
    get kittens_url(@kitten)
    assert_response :success
  end

  test "should destroy kitten" do
    assert_difference('Kitten.count', -1) do
      delete kitten_url(@kitten)
    end
    assert_redirected_to root_path
  end

  test "should create kitten" do
    get "/kittens/new"
    assert_response :success
    
    post "/kittens",params: { kitten: { name: "catname", age: 2, cuteness: "very cute", softness: "very soft" }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "li a", "catname"
  end

  test "should update kitten" do
    patch kitten_url(@kitten),
          params: { kitten: { name: "updatedCatName",
                              age: 5,
                              cuteness: "cute ++",
                              softness: "soft ++" } }
    assert_redirected_to kitten_path(@kitten)
    @kitten.reload
    assert_equal "updatedCatName", @kitten.name
  end
end
