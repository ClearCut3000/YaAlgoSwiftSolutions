// K. Ближайшая остановка

import Foundation

struct Coordinate: Hashable {
  let x: Int
  let y: Int
  
  func distance(to other: Coordinate) -> Int {
    return (x - other.x) * (x - other.x) + (y - other.y) * (y - other.y)
  }
}

typealias Coordinates = [Coordinate]

func sectorize(_ coordinate: Coordinate) -> Coordinate {
  return Coordinate(x: coordinate.x / 5, y: coordinate.y / 5)
}

func subwayWithMostStops(subways: Coordinates, stops: Coordinates) -> Int {
  var stopsBySeсtor = [Coordinate: [Coordinate]]()
  let maxDistanceSquared = 400
  
  for stop in stops {
    let seсtor = sectorize(stop)
    stopsBySeсtor[seсtor, default: []].append(stop)
  }
  
  var maxCount = 0
  var maxSubwayIndex = 0
  
  for (index, subway) in subways.enumerated() {
    let segment = sectorize(subway)
    var count = 0
    
    for dx in -4...4 {
      for dy in -4...4 {
        let neighborSector = Coordinate(x: segment.x + dx, y: segment.y + dy)
        if let stopsInSector = stopsBySeсtor[neighborSector] {
          for stop in stopsInSector {
            if subway.distance(to: stop) <= maxDistanceSquared {
              count += 1
            }
          }
        }
      }
    }
    
    if count > maxCount {
      maxCount = count
      maxSubwayIndex = index + 1
    }
  }
  
  return maxSubwayIndex
}

if let n = Int(readLine()!) {
  var subways = Coordinates()
  for _ in 0..<n {
    let coords = readLine()!.split(separator: " ").map { Int($0)! }
    subways.append(Coordinate(x: coords[0], y: coords[1]))
  }
  
  if let m = Int(readLine()!) {
    var stops = Coordinates()
    for _ in 0..<m {
      let coords = readLine()!.split(separator: " ").map { Int($0)! }
      stops.append(Coordinate(x: coords[0], y: coords[1]))
    }
    
    let result = subwayWithMostStops(subways: subways, stops: stops)
    print(result)
  }
}
