require 'rails_helper'

feature "user can delete question" do
  before :each do
    @question_1 = Question.create!(
      title: "This is a title and is totally long enough.",
      description: "You might not know the answer to this but I think it's long enough to be valid"
    )
    @question_2 = Question.create!(
      title: "This is a title and is maybe totally long enough.",
      description: "You might know the answer to this but I think it's long enough to be valid"
    )
  end

  scenario "user can delete a question from the question edit page" do
    visit "/"
    click_link @question_1.title
    click_link "edit"
    click_link "delete"

    expect(page).not_to have_content(@question_1.title)
    expect(page).to have_content(@question_2.title)
  end

  scenario "user can delete a question from the question show page" do
    visit "/"
    click_link question_1.title
    click_link "delete"

    expect(page).not_to have_content(question_1.title)
    expect(page).to have_content(question_2.title)
  end
end
