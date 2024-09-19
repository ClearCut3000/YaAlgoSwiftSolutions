// B. Расписание

import Foundation

func timeToMinutes(_ time: String) -> Int {
  let parts = time.split(separator: ".").map { Int($0)! }
  return parts[0] * 60 + (parts.count > 1 ? parts[1] : 0)
}

let n = Int(readLine()!)!
var lessons: [(start: Double, end: Double)] = []

for _ in 0..<n {
  let times = readLine()!.split(separator: " ").map { Double($0)! }
  lessons.append((times[0], times[1]))
}

lessons.sort {
  if $0.end != $1.end {
    return $0.end < $1.end
  } else {
    return $0.start < $1.start
  }
}

var selectedLessons: [(start: Double, end: Double)] = []
var lastEnd: Double = 0

for lesson in lessons {
  if lesson.start >= lastEnd {
    selectedLessons.append(lesson)
    lastEnd = lesson.end
  }
}

func formatTime(_ time: Double) -> String {
  return time == floor(time) ? String(Int(time)) : String(time)
}

print(selectedLessons.count)
for lesson in selectedLessons {
  let start = formatTime(lesson.start)
  let end = formatTime(lesson.end)
  print("\(start) \(end)")
}
