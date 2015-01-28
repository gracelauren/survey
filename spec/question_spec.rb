require('spec_helper')

describe(Question) do
  it{ should belong_to(:survey) }

  describe('#capitalize_question') do
    it("capitalizes first letter of question") do
      survey = Survey.create({ :name => "this is a survey." })
      question = Question.create({ :question => "what is the meaning of life?", :survey_id => survey.id() })
      expect(question.question()).to eq("What is the meaning of life?")
    end
  end

  # describe('#count') do
  #   it("increments and returns a counter") do
  #     survey = Survey.create({ :name => "this is a survey." })
  #     question = Question.create({ :question => "what is the meaning of life?", :survey_id => survey.id(), :order_num => survey.count() })
  #     question2 = Question.create({ :question => "huh?", :survey_id => survey.id(), :order_num => survey.count() })
  #     expect(survey.questions()[1].order_num()).to eq(2)
  #   end
  # end

describe('#count') do
  it("adds order num when saving new survey") do
    survey = Survey.create({ :name => "this is a survey." })
    question = Question.create({ :question => "what is the meaning of life?", :survey_id => survey.id() })
    question2 = Question.create({ :question => "huh?", :survey_id => survey.id() })
    expect(question2.order_num()).to eq(2)
  end
end


end
