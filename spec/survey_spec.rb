require('spec_helper')

describe(Survey) do

  it { should have_many(:questions) }

  describe('#capitalize_name') do
    it("capitalizes first letter of each word in name") do
      survey = Survey.create({ :name => "this is a survey." })
      expect(survey.name()).to eq("This Is A Survey.")
    end
  end

end
