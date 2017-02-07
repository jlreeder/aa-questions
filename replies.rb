require_relative 'questions_database'

class Reply

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

  def initialize(options)

  end
end



reply = Reply.find_by_id(1)
p reply
