require 'test_helper'

class ObjectivesControllerTest < ActionController::TestCase
  setup do
    @objective = objectives(:one)
    @program = programs(:one)
    @objective.program = @program
    @objective.save
  end

  test "should get index" do
    get :index, program_id: @program
    assert_response :success
    assert_not_nil assigns(:objectives)
  end

  test "should get new" do
    get :new, program_id: @program
    assert_response :success
  end

  test "should create objective" do
    assert_difference('Objective.count') do
      post :create, objective: { title: @objective.title }, program_id: @program
    end

    assert_redirected_to objective_path(assigns(:objective))
  end

  test "should show objective" do
    get :show, id: @objective, program_id: @program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @objective, program_id: @program
    assert_response :success
  end

  test "should update objective" do
    put :update, id: @objective, objective: { title: @objective.title }, program_id: @program
    assert_redirected_to objective_path(assigns(:objective))
  end

  test "should destroy objective" do
    assert_difference('Objective.count', -1) do
      delete :destroy, id: @objective, program_id: @program
    end

    assert_redirected_to objectives_path
  end
end
