# MOVE_OFFSET is a the logic of how a knight moves in chess
MOVE_OFFSET = [1, -1, 2, -2].permutation(2).filter { |x, y| x != -y }

# Main method
def kngiht_moves(start_postion, end_position)
  unless check_position(start_postion) && check_position(end_position)
    'The positions given are invalid'
  end

  path = shortest_path(start_postion, end_position)
  print "You made it in #{path.size} moves. Here's Your path: \n"
  path.each { |node| p node }
end

# Method to find the next adjacent moves of a kngiht
def get_next_moves(position)
  result = MOVE_OFFSET.map { |x| [x[0] + position[0], x[1] + position[1]] }
  result.filter { |x| check_position(x) }
end

# Check if the position are valid or not
def check_position(position)
  position.all? { |point| point >= 0 && point < 8 }
end

# Main logic method that finds the shortest path
def shortest_path(start_postion, end_position)
  # Queue keeps track of next moves
  queue = [[start_postion]]

  # Visited keeps track of all visited nodes
  visited = [start_postion]

  # Stop when the next move has the endd_position
  until queue.empty?
    curr_path = queue.shift
    return curr_path if curr_path.last == end_position

    move_list = get_next_moves(curr_path.last)
    move_list.each do |move|
      next if visited.include?(move)

      visited << move

      queue << (curr_path + [move])
    end
  end
  nil
end


print kngiht_moves([0, 0], [3, 3])
