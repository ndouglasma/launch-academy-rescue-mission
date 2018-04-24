require 'rails_helper'

feature "user can submit a new question" do
  scenario "valid question" do
    question_1 = Question.new(
      title: "This is a title and is totally long enough.",
      description: "You might not know the answer to this but I think it's long enough to be valid"
    )

      expect(question_1.save).to eq(true)
  end

  context "invalid question" do
    scenario "user enters title that's too short" do
      question_1 = Question.new(
        title: "too short",
        description: "You might not know the answer to this but I think it's long enough to be valid"
      )

      expect(question_1.save).to eq(false)
    end

    scenario "user enters description that's too short" do
      question_1 = Question.new(
        title: "This is a title and is totally long enough.",
        description: "too short"
      )

      expect(question_1.save).to eq(false)
    end
  end
end
