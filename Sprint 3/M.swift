//  M. Золотая середина

import Foundation

func getMean(north: [Int], south: [Int], n: Int, m: Int) -> Double {
  let length = n + m
  let resLen = length / 2 + 1
  var i = 0, j = 0
  var res: [Int] = []
  
  for _ in 0..<resLen {
    if i < n && j < m {
      if north[i] < south[j] {
        res.append(north[i])
        i += 1
      } else {
        res.append(south[j])
        j += 1
      }
    } else if i < n {
      res.append(north[i])
      i += 1
    } else {
      res.append(south[j])
      j += 1
    }
  }
  
  if length % 2 == 0 {
    return Double(res[res.count - 1] + res[res.count - 2]) / 2.0
  } else {
    return Double(res[res.count - 1])
  }
}

if let n = Int(readLine()!),
   let m = Int(readLine()!),
   let nInput = readLine(),
   let mInput = readLine() {
  
  let nArray = nInput.split(separator: " ").compactMap { Int($0) }
  let mArray = mInput.split(separator: " ").compactMap { Int($0) }
  
  let mediana = getMean(north: nArray, south: mArray, n: n, m: m)
  print(mediana)
}

