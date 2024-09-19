// L. Два велосипеда

import Foundation

func binarySearch(arr: [Int], _ n: Int, x: Int, left: Int, right: Int) -> Int {
  var left = left
  var right = right
  
  while right - left > 1 {
    let mid = left + (right - left) / 2
    x <= arr[mid] ? (right = mid) : (left = mid + 1)
  }
  
  if arr[left] >= x {
    return left + 1
  } else if arr[right] >= x {
    return right + 1
  } else {
    return -1
  }
}

if let n = Int(readLine()!),
   let money = readLine(),
   let price = Int(readLine()!) {
  let moneyTimeline = money.split(separator: " ").map { Int($0)! }
  
  let indexFirstBike = binarySearch(arr: moneyTimeline, n, x: price, left: 0, right: n - 1)
  let indexTwoBikes = binarySearch(arr: moneyTimeline, n, x: price * 2, left: 0, right: n - 1)
  
  print(indexFirstBike, indexTwoBikes)
}

