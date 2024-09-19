// F. Частое слово

func main() -> String {
  
  let n = Int(readLine()!)!
  
  var words: [String] = []
  for _ in 0..<n {
    let word = readLine()!
    words.append(word)
  }
  
  var freq = [String: Int]()
  for word in words {
    freq[word, default: 0] += 1
  }
  
  return freq.lazy.sorted(by: {
    $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value
  })
  .map({ $0.key })
  .first!
}

let result = main()
print(result)

