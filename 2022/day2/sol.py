scores = {"A Y": 8, "A X": 4, "A Z": 3, "B Y": 5, "B X": 1, "B Z": 9, "C Y": 2, "C X": 7, "C Z": 6}
def part1():
  with open("./input.txt", "r") as f:
    points = 0
    for line in f:
      points += scores[line.strip("\n")]
    return points

translate = {"A X": "A Z", "A Y": "A X", "A Z": "A Y", "B X": "B X", "B Y": "B Y", "B Z": "B Z", "C X": "C Y", "C Y": "C Z", "C Z": "C X"}
def part2():
  with open("./input.txt", "r") as f:
    points = 0
    for line in f:
      points += scores[translate[line.strip("\n")]]
    return points

print(part1())
print(part2())