require_relative '../db/sqlrunner'
require_relative '../models/ranking'

class User

  attr_accessor :id, :name
  attr_reader :password

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @password = options['password']
    @current_user_status = options['current_user_status']
  end

  def rankings()
    sql = "SELECT * FROM rankings WHERE user_id = #{@id}"
    result = Ranking.map_items(sql)
    return result
  end

  def self.login?(id, password)
    sql = "SELECT * FROM users WHERE id = #{id}"
    user = User.map_item(sql)
    if user.password == password
      return true
    else
      return false
    end
  end

  def self.set_current_user(id)
    sql = "UPDATE users SET current_user_status = 'f'"
    SqlRunner.run_sql(sql)
    sql = "UPDATE users SET current_user_status = 't' WHERE id = #{id}"
    SqlRunner.run_sql(sql)
  end

  def self.current_user()
    sql = "SELECT * FROM users WHERE current_user_status = 't'"
    result = User.map_item(sql)
    return result
  end

  def save()
    sql = "INSERT INTO users (name, password) VALUES ('#{@name}', '#{@password}') RETURNING *"
    user = SqlRunner.run_sql(sql).first
    result = User.new( user )
    return result
  end

  def self.all()
    sql = "SELECT * FROM users"
    return User.map_items(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM users WHERE id = #{id};"
    return User.map_item(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run_sql(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM users WHERE id = #{id}"
    SqlRunner.run_sql(sql)
  end

  def self.map_items(sql)
    user = SqlRunner.run_sql(sql)
    result = user.map { |u| User.new( u ) }
    return result
  end

  def self.map_item(sql)
    result = User.map_items(sql)
    return result.first
  end

end