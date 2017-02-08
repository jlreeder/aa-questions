require_relative 'questions_database'

class QuestionFollow

  attr_accessor :id, :user_follower_id, :question_followed_id

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    question_follow.empty? ? nil : QuestionFollow.new(question_follow.first)
  end

  def initialize(options)
    @id = options['id']
    @user_follower_id = options['user_follower_id']
    @question_followed_id = options['question_followed_id']
  end
end



question_follow = QuestionFollow.find_by_id(1)
p question_follow.question_followed_id
