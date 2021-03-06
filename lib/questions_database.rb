require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('student_questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end
