require_relative 'questions_database'
require_relative 'reply'

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

  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_asker_id = ?
    SQL

    return nil if questions.empty?
    questions.map { |ele| Question.new(ele) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_asker_id = options['user_asker_id']
  end


  def author
    author_found = QuestionsDatabase.instance.execute(<<-SQL, @user_asker_id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    author_found.empty? ? nil : author_found.first
  end

  def replies
    Reply.find_by_question_id(@id)
  end
end
