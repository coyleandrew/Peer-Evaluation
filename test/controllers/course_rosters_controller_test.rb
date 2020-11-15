require 'test_helper'

class CourseRostersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_roster = course_rosters(:one)
  end

  test "should get index" do
    get course_rosters_url
    assert_response :success
  end

  test "should get new" do
    get new_course_roster_url
    assert_response :success
  end

  test "should create course_roster" do
    assert_difference('CourseRoster.count') do
      post course_rosters_url, params: { course_roster: { course_id: @course_roster.course_id, user_id: @course_roster.user_id } }
    end

    assert_redirected_to course_roster_url(CourseRoster.last)
  end

  test "should show course_roster" do
    get course_roster_url(@course_roster)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_roster_url(@course_roster)
    assert_response :success
  end

  test "should update course_roster" do
    patch course_roster_url(@course_roster), params: { course_roster: { course_id: @course_roster.course_id, user_id: @course_roster.user_id } }
    assert_redirected_to course_roster_url(@course_roster)
  end

  test "should destroy course_roster" do
    assert_difference('CourseRoster.count', -1) do
      delete course_roster_url(@course_roster)
    end

    assert_redirected_to course_rosters_url
  end
end
