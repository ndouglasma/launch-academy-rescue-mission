require 'rails_helper'

feature "User views all questions" do
  context "by visiting the questions url" do
    let!(:question_1) { create :question }
    let!(:question_2) { create :question }

    visit '/questions'

    scenario "displays all the questions" do
      expect(page).to have_content("Happy")
      # expect(page).to have_content(camper_1.name)
      # expect(page).to have_content(camper_2.name)
    end
  end

  context "by visiting the questions url again" do
    let!(:question_3) { Question.create!(
      title: "This is a title and is totally long enough.",
      description: "You might not know the answer to this but I think it's long enough to be valid"
    )}
    let!(:question_4) { Question.create!(
      title: "This is a title and is maybe totally long enough.",
      description: "You might know the answer to this but I think it's long enough to be valid"
    )}

    scenario "questions titles are visible in the order they were posted" do
      visit '/questions'

      expect(page.body.index(question_1.title)).to be < page.body.index(question_2.title)
    end

    scenario "user is redirected to questions from root" do
      visit '/'

      expect(page).to have_content(question_1.title)
      expect(page).to have_content(question_2.title)
    end
  end
end
