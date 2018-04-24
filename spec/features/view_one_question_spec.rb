require 'rails_helper'

feature "view one question" do
  let!(:question_1) { Question.create!(
    title: "This is a title and is totally long enough.",
    description: "You might not know the answer to this but I think it's long enough to be valid"
  )}
  let!(:question_2) { Question.create!(
    title: "This is a title and is maybe totally long enough.",
    description: "You might know the answer to this but I think it's long enough to be valid"
  )}

  scenario "question show page accessible from index page" do
    visit '/questions'
    click_link question_1.title

    expect(page).to have_content(question_1.title)
    expect(page).not_to have_content(question_2.title)
  end

  scenario "show page includes title and description" do
    visit '/questions'
    click_link question_1.title

    expect(page).to have_content(question_1.title)
    expect(page).to have_content(question_1.description)
  end
end
