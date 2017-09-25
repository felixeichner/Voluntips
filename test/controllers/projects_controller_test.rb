require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { accom_standard: @project.accom_standard, accomodation: @project.accomodation, address: @project.address, costs: @project.costs, costs_week: @project.costs_week, email: @project.email, images: @project.images, lat: @project.lat, lgt: @project.lgt, min_weeks: @project.min_weeks, preview: @project.preview, qualification: @project.qualification, slug: @project.slug, summary: @project.summary, tel: @project.tel, title: @project.title, webpage: @project.webpage, work: @project.work } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { accom_standard: @project.accom_standard, accomodation: @project.accomodation, address: @project.address, costs: @project.costs, costs_week: @project.costs_week, email: @project.email, images: @project.images, lat: @project.lat, lgt: @project.lgt, min_weeks: @project.min_weeks, preview: @project.preview, qualification: @project.qualification, slug: @project.slug, summary: @project.summary, tel: @project.tel, title: @project.title, webpage: @project.webpage, work: @project.work } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
