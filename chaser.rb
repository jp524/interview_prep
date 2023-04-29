# https://www.codewars.com/kata/628df6b29070907ecb3c2d83

def dist_running_with_one_sprint(speed, time)
  speed * (time + 1)
end

def adding_sprint(distance, speed, nth_sprint)
  distance - 2 * speed + 3 * (speed - (nth_sprint - 1))
end

def max_nb_sprints(speed, time)
  if speed < time
    speed
  else
    (time / 2.to_f).ceil
  end
end

def SpeedAndTime(speed, time)
  max_nb_sprints = max_nb_sprints(speed, time)
  max_dist = dist_running_with_one_sprint(speed, time)

  if max_nb_sprints > 1
    (2..max_nb_sprints).each do |nth_sprint|
      new_dist = adding_sprint(max_dist, speed, nth_sprint)
      break if new_dist < max_dist

      max_dist = new_dist
    end
  end
  max_dist
end

# SpeedAndTime(2, 4) #10
# SpeedAndTime(2, 3) #8
# SpeedAndTime(1, 1) #2
# p SpeedAndTime(10, 1) #20
# p SpeedAndTime(957, 449) #569418
p SpeedAndTime(425, 26) #16341
