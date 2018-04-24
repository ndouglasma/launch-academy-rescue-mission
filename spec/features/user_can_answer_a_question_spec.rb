require 'rails_helper'

feature "user can answer a question" do
  let!(:question_1) { Question.create!(
    title: "This is a title and is totally long enough.",
    description: "You might not know the answer to this but I think it's long enough to be valid"
  )}

  scenario "user fills form correctly so answer shows on page" do
    visit '/'
    click_link question_1.title
    fill_in "Answer Text:", with: "Have you turned it off and on again? No? Maybe you should try that."
    click_on "Submit"

    expect(page).to have_content("Have you turned it off and on again? No? Maybe you should try that.")
  end

  scenario "user sees errors when description is < 50 characters long" do
    visit '/'
    click_link question_1.title
    fill_in "Answer Text:", with: "No."
    click_on "Submit"

    expect(page).to have_content("Description is too short (minimum is 50 characters)")
  end
end
