require_relative 'questions_database'

class QuestionLike

  attr_accessor :id, :user_liker_id, :question_liked_id

  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    question_like.empty? ? nil : QuestionLike.new(question_like.first)
  end

  def initialize(options)
    @id = options['id']
    @user_liker_id = options['user_liker_id']
    @question_liked_id = options['question_liked_id']
  end
end



question_like = QuestionLike.find_by_id(1)
p question_like
