require_relative 'questions_database'

class Reply

  attr_accessor :id, :body, :user_asker_id, :question_id, :parent_reply_id

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    reply.empty? ? nil : Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_asker_id = ?
      SQL

    return nil if replies.empty?
    replies.map { |ele| Reply.new(ele) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
      SQL

    return nil if replies.empty?
    replies.map { |ele| Reply.new(ele) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @user_asker_id = options['user_asker_id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
  end
end



# reply = Reply.find_by_id(1)
# p Reply.find_by_user_id(2)
# p Reply.find_by_question_id(1)
