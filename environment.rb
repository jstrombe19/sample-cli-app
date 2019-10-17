require 'sqlite3'
require 'pry'
require_relative './student'
require_relative './student_finder'

DB = {conn: SQLite3::Database.new('db/school.db')}

StudentFinder.welcome
StudentFinder.get_user_input

# binding.pry
