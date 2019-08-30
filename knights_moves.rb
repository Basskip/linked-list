def knight_moves(start, target)
    moves = Hash.new()
    shifts = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
    8.times do |x|
        8.times do |y|
            dest = []
            shifts.each do |shift|
                if (x + shift[0]).between?(0,7) && (y + shift[1]).between?(0,7)
                    dest << [x + shift[0], y + shift [1]]
                end
            end
            moves[[x,y]] = dest
        end
    end

    queue = []
    queue << [start,[]]
    

    loop do
        current_path = queue.shift
        current_square = current_path[0]
        if current_square == target
            return current_path[1] << target
            break
        else
            current_path[1] << current_square
            moves[current_square].each do |square|
                if !(current_path[1].include?square)
                    queue << [square, current_path[1].dup]
                    
                end
            end
        end
    end
end

