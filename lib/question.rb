class Question < ActiveRecord::Base
  validates(:question, {:presence => true})
  belongs_to :survey
  before_save(:capitalize_question, :count)


private

  define_method(:capitalize_question) do
    self.question[0] = self.question[0].capitalize()
  end

  define_method(:count) do
    if self.new_record?()

      survey = self.survey()
      if survey.questions().any?()
        order_num = survey.questions().last(-1).order_num + 1
      else
        order_num = 1
      end
      self.order_num = order_num

    end
  end

end
