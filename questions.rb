require_relative 'questions_database'

class Question

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end


  def initialize(options)

  end
end



question = Question.find_by_id(1)
p question 
