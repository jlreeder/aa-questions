require 'questions_database'

describe "QuestionDatabase" do
  it "create an instance of question database" do
    expect(QuestionsDatabase.instance).to be_an_instance_of(QuestionsDatabase)
  end
end
