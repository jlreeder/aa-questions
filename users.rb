require_relative 'questions_database'

class User

  def self.find_by_id(id)
    user = usersDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    user.empty? ? nil : User.new(user.first)
  end

  def initialize(options)

  end
end



user = User.find_by_id(1)
p user
