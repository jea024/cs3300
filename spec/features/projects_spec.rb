require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    login_user
    before(:each) do
      visit new_project_path
      fill_in "Title", with: "Test title"
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    login_user
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      fill_in "Description", with: "New description content"
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      fill_in "Description", with: ""
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    login_user
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Project Details"
      click_button "Destroy this project"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end