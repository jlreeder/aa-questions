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

    question.empty? ? nil : Question.new(question.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_asker_id = options['user_asker_id']
  end
end



question = Question.find_by_id(1)
p question
