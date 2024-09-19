// A. Разворот строки

let string = readLine()!.split(separator: " ").map { String($0)}
print(string.reversed().map { String($0) }.joined(separator: " "))
