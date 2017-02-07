require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('student_questions.db')
  end
end

a = QuestionsDatabase.instance
