require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

post("/surveys") do
  name = params.fetch('name')
  Survey.create({:name => name})
  redirect('/')
end

get("/surveys/:id") do
  @survey_id = params.fetch('id').to_i()
  erb(:survey)
end

post("/questions") do
  question = params.fetch('question')
  survey_id = params.fetch('survey_id').to_i()
  Question.create({ :question => question, :survey_id => survey_id })
  url = "/surveys/" + survey_id.to_s()
  redirect(url)
end

get("/questions/:id") do
  @question_id = params.fetch('id').to_i()
  erb(:question)
end

patch("/surveys/:id") do
  @survey_id = params.fetch('id').to_i()
  survey = Survey.find(@survey_id)
  survey.update({:name => params.fetch('name')})
  redirect('/')
end

delete("/surveys/:id") do
  @survey_id = params.fetch('id').to_i()
  survey = Survey.find(@survey_id)
  survey.delete()
  redirect('/')
end

post("/reorder") do
  survey = Survey.find(params.fetch('survey_id').to_i())
  order_nums = params.fetch('order_nums')
  survey.change_order(order_nums)
  url = "/surveys/" + survey.id().to_s()
  redirect(url)
end

delete("/questions/:id") do
  question_id = params.fetch('id').to_i()
  survey_id = params.fetch('survey_id').to_i()
  Question.find(question_id).delete()
  url = "/surveys/" + survey_id.to_s()
  redirect(url)
end
