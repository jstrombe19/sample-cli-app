class Student
    attr_reader :name, :age, :id

    def initialize name, age, id=nil
        @id = id
        @name = name
        @age = age
    end

    def self.all
        sql = <<-SQL
            SELECT * FROM students
        SQL
        students = DB[:conn].execute(sql)
        students.map do |student|
            Student.new(student[1], student[2], student[0])
        end
    end

    def delete
        sql = <<-SQL
            DELETE FROM students WHERE id = ?
        SQL
        DB[:conn].execute(sql, self.id)
    end

    def save
        sql = <<-SQL
            INSERT INTO students (name, age)
            VALUES (?, ?)
        SQL
        DB[:conn].execute(sql, self.name, self.age)
    end

    def self.create_table
        sql = <<-SQL
            CREATE TABLE IF NOT EXISTS students (
                id INTEGER PRIMARY KEY,
                name TEXT,
                age INTEGER
            )
        SQL
        DB[:conn].execute(sql)
    end

end
