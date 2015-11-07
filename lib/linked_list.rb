require 'pry'
require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def each
  node = @head

    while !node.nil?
      yield(node)
      node = node.next_node
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def [](index)
    @result = @head
    index.times do
      @result = @result.next_node
      if @result.nil?
        return nil
      end
    end
    @result
  end

  def to_s
    string = "LinkedList("
    self.each do |n|
      string.concat(n.info + ", ")
    end

    string.chop!.chop! if string.end_with?(", ")

    string + ")"
  end

  def insert(index, data)
   new_node = Node.new(data, self[index])

   if index == 0
     @head = new_node
   else
     self[index - 1].next_node = new_node
   end
 end

 def remove(index)
   if index == 0
     @head = self[1]
   else
     self[index - 1].next_node = self[index + 1]
   end
 end
end
