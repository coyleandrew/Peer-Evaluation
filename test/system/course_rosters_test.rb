require "application_system_test_case"

class CourseRostersTest < ApplicationSystemTestCase
  setup do
    @course_roster = course_rosters(:one)
  end

  test "visiting the index" do
    visit course_rosters_url
    assert_selector "h1", text: "Course Rosters"
  end

  test "creating a Course roster" do
    visit course_rosters_url
    click_on "New Course Roster"

    fill_in "Course", with: @course_roster.course_id
    fill_in "User", with: @course_roster.user_id
    click_on "Create Course roster"

    assert_text "Course roster was successfully created"
    click_on "Back"
  end

  test "updating a Course roster" do
    visit course_rosters_url
    click_on "Edit", match: :first

    fill_in "Course", with: @course_roster.course_id
    fill_in "User", with: @course_roster.user_id
    click_on "Update Course roster"

    assert_text "Course roster was successfully updated"
    click_on "Back"
  end

  test "destroying a Course roster" do
    visit course_rosters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course roster was successfully destroyed"
  end
end
