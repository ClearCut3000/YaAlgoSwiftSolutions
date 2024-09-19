//  N. Клумбы

import Foundation

struct Interval: Comparable {
  var start: Int
  var end: Int
  
  static func < (lhs: Interval, rhs: Interval) -> Bool {
    if lhs.start == rhs.start {
      return lhs.end < rhs.end
    }
    return lhs.start < rhs.start
  }
}

func mergeIntervals(_ intervals: [Interval]) -> [Interval] {
  guard intervals.count > 0 else { return [] }
  
  var sortedIntervals = intervals.sorted()
  var results: [Interval] = []
  
  var bigStart = sortedIntervals[0].start
  var bigEnd = sortedIntervals[0].end
  
  for idx in 1..<sortedIntervals.count {
    if bigStart <= sortedIntervals[idx].start && sortedIntervals[idx].start <= bigEnd {
      if sortedIntervals[idx].end > bigEnd {
        bigEnd = sortedIntervals[idx].end
      }
    } else {
      results.append(Interval(start: bigStart, end: bigEnd))
      bigStart = sortedIntervals[idx].start
      bigEnd = sortedIntervals[idx].end
    }
  }
  results.append(Interval(start: bigStart, end: bigEnd))
  
  return results
}

if let n = Int(readLine()!) {
  var intervals: [Interval] = []
  
  for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    intervals.append(Interval(start: input[0], end: input[1]))
  }
  
  let mergedIntervals = mergeIntervals(intervals)
  
  for interval in mergedIntervals {
    print("\(interval.start) \(interval.end)")
  }
}
