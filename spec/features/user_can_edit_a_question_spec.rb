require 'rails_helper'

feature "user can edit a question" do
  let!(:question_1) { Question.create!(
    title: "This is a title and is totally long enough.",
    description: "You might not know the answer to this but I think it's long enough to be valid"
    )}

    let!(:valid_title) { "a"*20 }
    let!(:invalid_title) { "a"*5 }

    scenario "user can get to edit form from show page" do
      visit '/'
      click_link question_1.title
      click_link "edit"

      expect(page).to have_selector ("form")
      # expect(page).to have_field("Please enter a question title:", :text => question_1.title)
      # expect(page).to have_field("Please enter a question description:", :text => question_1.description)
    end

    scenario "user provides valid information and question is successfully edited" do
      visit '/'
      click_link question_1.title
      click_link "edit"

      fill_in "title", with: valid_title
      click_on "Update Question"

      expect(page).to have_content(valid_title)
      expect(page).to have_content(question_1.description)
    end

    scenario "user sees errors if form is filled out incorrectly" do
      visit '/'
      click_link question_1.title
      click_link "edit"

      fill_in "title", with: invalid_title
      click_on "Update Question"

      expect(page).to have_content("Title is too short")
      # expect(page).to have_field("Please enter a question title:", :text => invalid_title)
      # expect(page).to have_field("Please enter a question description:", :text => question_1.description)
    end
  end
end
