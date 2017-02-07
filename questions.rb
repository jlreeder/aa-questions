require_relative 'questions_database'

class Question

  attr_accessor :id, :title, :body, :user_asker_id

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

  def self.find_by_author(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_asker_id = ?
    SQL

    p questions
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_asker_id = options['user_asker_id']
  end
end



# question = Question.find_by_id(1)
# p question.title
questions = Question.find_by_author(1)
