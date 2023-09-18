def getPriority(c):
  priority = 0
  if "a" <= c <= "z":
    priority += ord(c) - ord("a") + 1
  else:
    priority += ord(c) - ord("A") + 27
  return priority

def part1():
  with open("./input.txt", "r") as f:
    priority = 0
    for line in f:
      line = line.strip("\n")
      left, right = line[:len(line)//2],line[len(line)//2:]
      for c in left:
        if c in right: 
          priority += getPriority(c)
          break
    return priority
  
def part2():
  with open("./input.txt", "r") as f:
    priority = 0
    lines = [l.strip("\n") for l in f]
    groups = [(lines[i], lines[i+1], lines[i+2]) for i in range(0, len(lines), 3)]
    for g in groups:
      for c in g[0]:
        if c in g[1] and c in g[2]:
          priority += getPriority(c)
          break
    return priority
  
print(part1())
print(part2())
