class AnimalGame

  def initialize_game
    @top_node = Node(nil,nil,nil)          # very top node starts with nothing
    animal_node = @top_node.newLeftNode()  # left node contains first actual question
    animal_node.animal="cat";
    
  end
  
  attr_reader :top_node

  def welcome
    print <<_END_

Welcome to the Animal Game

Please answer each question with a "y" or "n"
    
_END_
    
  end


  

  def play_game
    self.welcome()
    self.initialize_game()
    self.play_game_from_node(self.top_node())
    
  end

  def promptForYesNo
    loop do
      answer = gets
      if (answer =~ /^\s*y/i)
        return true
      else if (answer =~ /^\s*n/i)
        return false
      end
      puts "please answer yes or no"
    end
  end
  
  
  def play_game_from_node(this_node)  # recursive method
  

    puts current_node.question
    print " > "
    answeredYes = self.promptForYesNo()
    if answeredYes
      if (current_node.isLeaf())  # yea!  we're done!
        puts "You found the animal you were seeking"
      else
        self.play_game_from_node(current_node.getYes())
      end
    else  # player answered no to question
      if (!current_node.isLeaf()) # not at a leaf means we're at a branch
        self.play_game_from_node(current_node.getNo())
      else  # uh-oh.  got to the end of the questions and did not find the animal
        self.get_new_question_for_node(current_node)
      end
    end  
      
  end
  
  
#  def get_new_question_for_node(lastNode)
    # need to prompt for a new question and then edit the tree
    
 # end
  
end





class BinaryNode
  def initialize(upNode,leftNode,rightNode)
    @up = upNode
    @left = leftNode
    @right = rightNode

  end

  def reproduce # create offspring, set parent node to myself
    return BinaryNode.new(self,nil,nil)
  end

  def newLeftNode
    node = self.reproduce() 
    @left = node
  end

  def newRighNode
    node = self.reproduce()
    @right = node
  end
  
  
  attr_reader :left
  attr_reader :right
  attr_reader :up  # parent node

end

class QuestionNode < BinaryNode

  def getYes
    return self.left()
  end

  def getNo
    return self.right()
  end

  def setYes(node)
    self.left = node
  end

  def setNo(no)
    set.right = node
  end

  def initialize(string)
    super
    @question = string
  end
  attr_reader :question

  def getText
    return self.question()
  end

  def isLeaf
    return false
  end
  
end

class AnimalNode < BinaryNode

  def initialize(string)
    @animal = string
  end
  
  attr_reader :animal

  def getText
    return self.question()
  end

  def question
    q = "Is it "
    q += self.article(self.animal())
    q += " "
    q += self.animal()
    q += "?"
    return q
  end

  def article(word)
    if (word =~ /^[aeiou]/i)  # word starts with a vowel
      return "an"
    else
      return "a"
    end
  end
  
  def yes ; return nil; end
  def no ; return nil; end
  def isLeaf ; return true; end
  
end


#node = AnimalNode.new("elephant")
#puts node.question()


