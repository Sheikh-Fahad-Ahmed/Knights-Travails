MOVE_OFFSET = [1, -1, 2, -2].permutation(2).filter { |x, y| x != -y }

def kngiht_moves(start_postion, end_position)
  unless check_position(start_postion) && check_position(end_position)
    'The positions given are invalid'
  end

  
end

def get_next_moves(position)
  result = MOVE_OFFSET.map { |x| [x[0] + position[0], x[1] + position[1]] }
  result.filter { |x| check_position(x) }
end

def check_position(position)
  position.all? { |point| point >= 0 && point < 8 }
end

print MOVE_OFFSET
puts
print get_next_moves([3, 3])