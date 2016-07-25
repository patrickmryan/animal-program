class AnimalGame
  
end

class Node
  def initialize
    @left = nil
    @right = nil
  end

end

class QuestionNode < Node
  def yes
    return @left
  end

  def no
    return @right
  end
end

q = QuestionNode.new()
