require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    result = PlayDBConnection.instance.execute(<<-SQL, @title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL

    result
  end

  # returns all plays written by playwright
  def self.find_by_playwright(name)
    result = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        plays.title
      FROM
        plays
      JOIN
        playwrights ON playwrights.id = plays.playwright_id
      WHERE
        playwrights.name = ?
    SQL

    result
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    result = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    result
  end

  def initialize(options)
    @id = options['id'] # @id should initially be nil
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already exists" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL

    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} does not exist" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  # returns all plays written by playwright
  def get_plays
    result = PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        plays.title
      FROM
        plays
      JOIN
        playwrights ON playwrights.id = plays.playwright_id
      WHERE
        playwrights.id = ?
    SQL

    result
  end

  def self.delete(id)
    raise "#{self} does not exist" unless id
    PlayDBConnection.instance.execute(<<-SQL, id)
    DELETE FROM
      playwrights
    WHERE
      id = ?
    SQL
  end
end
