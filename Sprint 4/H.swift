// H. Подстроки

func lengthOfLongestSubstring(_ s: String) -> Int {
  var maxLength = 0
  var charSet = Set<Character>()
  var left = 0
  var right = 0
  
  let chars = Array(s)
  while right < chars.count {
    if !charSet.contains(chars[right]) {
      
      charSet.insert(chars[right])
      right += 1
      maxLength = max(maxLength, right - left)
    } else {
      
      charSet.remove(chars[left])
      left += 1
    }
  }
  
  return maxLength
}

let string = readLine()!
let result = lengthOfLongestSubstring(string)
print(result)
