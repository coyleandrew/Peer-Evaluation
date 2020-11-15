require "application_system_test_case"

class ProjectTeamsTest < ApplicationSystemTestCase
  setup do
    @project_team = project_teams(:one)
  end

  test "visiting the index" do
    visit project_teams_url
    assert_selector "h1", text: "Project Teams"
  end

  test "creating a Project team" do
    visit project_teams_url
    click_on "New Project Team"

    fill_in "Project", with: @project_team.project_id
    fill_in "Score", with: @project_team.score
    fill_in "Team", with: @project_team.team_id
    click_on "Create Project team"

    assert_text "Project team was successfully created"
    click_on "Back"
  end

  test "updating a Project team" do
    visit project_teams_url
    click_on "Edit", match: :first

    fill_in "Project", with: @project_team.project_id
    fill_in "Score", with: @project_team.score
    fill_in "Team", with: @project_team.team_id
    click_on "Update Project team"

    assert_text "Project team was successfully updated"
    click_on "Back"
  end

  test "destroying a Project team" do
    visit project_teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project team was successfully destroyed"
  end
end
