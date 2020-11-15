require "application_system_test_case"

class TeamMemberProjectScoresTest < ApplicationSystemTestCase
  setup do
    @team_member_project_score = team_member_project_scores(:one)
  end

  test "visiting the index" do
    visit team_member_project_scores_url
    assert_selector "h1", text: "Team Member Project Scores"
  end

  test "creating a Team member project score" do
    visit team_member_project_scores_url
    click_on "New Team Member Project Score"

    fill_in "Project team", with: @team_member_project_score.project_team_id
    fill_in "Score", with: @team_member_project_score.score
    fill_in "Team member", with: @team_member_project_score.team_member_id
    click_on "Create Team member project score"

    assert_text "Team member project score was successfully created"
    click_on "Back"
  end

  test "updating a Team member project score" do
    visit team_member_project_scores_url
    click_on "Edit", match: :first

    fill_in "Project team", with: @team_member_project_score.project_team_id
    fill_in "Score", with: @team_member_project_score.score
    fill_in "Team member", with: @team_member_project_score.team_member_id
    click_on "Update Team member project score"

    assert_text "Team member project score was successfully updated"
    click_on "Back"
  end

  test "destroying a Team member project score" do
    visit team_member_project_scores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team member project score was successfully destroyed"
  end
end
