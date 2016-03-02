class User

  def initialize(name, marker)
    @id = :user
    @name = name
    @marker = marker
  end

  attr_reader :name, :marker, :id

  def play
    gets.chomp
  end

end