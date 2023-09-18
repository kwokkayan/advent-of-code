def part1():
  most = 0
  curr = 0
  with open("./input.txt", "r") as f:
    for line in f:
      if line == "\n":
        if curr > most:
          most = curr
        curr = 0
      else:
        curr += int(line)
  return most

def part2():
  most = [0, 0, 0]
  curr = 0
  with open("./input.txt", "r") as f:
    for line in f:
      if line == "\n":
        if curr > most[0]:
          most[2] = most[1]
          most[1] = most[0]
          most[0] = curr
        elif curr > most[1]:
          most[2] = most[1]
          most[1] = curr
        elif curr > most[2]:
          most[2] = curr
        curr = 0
      else:
        curr += int(line)
  return sum(most)

print(part1())
print(part2())