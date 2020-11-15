require 'test_helper'

class TeamMemberProjectScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_member_project_score = team_member_project_scores(:one)
  end

  test "should get index" do
    get team_member_project_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_team_member_project_score_url
    assert_response :success
  end

  test "should create team_member_project_score" do
    assert_difference('TeamMemberProjectScore.count') do
      post team_member_project_scores_url, params: { team_member_project_score: { project_team_id: @team_member_project_score.project_team_id, score: @team_member_project_score.score, team_member_id: @team_member_project_score.team_member_id } }
    end

    assert_redirected_to team_member_project_score_url(TeamMemberProjectScore.last)
  end

  test "should show team_member_project_score" do
    get team_member_project_score_url(@team_member_project_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_member_project_score_url(@team_member_project_score)
    assert_response :success
  end

  test "should update team_member_project_score" do
    patch team_member_project_score_url(@team_member_project_score), params: { team_member_project_score: { project_team_id: @team_member_project_score.project_team_id, score: @team_member_project_score.score, team_member_id: @team_member_project_score.team_member_id } }
    assert_redirected_to team_member_project_score_url(@team_member_project_score)
  end

  test "should destroy team_member_project_score" do
    assert_difference('TeamMemberProjectScore.count', -1) do
      delete team_member_project_score_url(@team_member_project_score)
    end

    assert_redirected_to team_member_project_scores_url
  end
end
