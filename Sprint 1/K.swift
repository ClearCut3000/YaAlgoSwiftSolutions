//  K. Списочная форма

func calculateListForm(_ xListForm: [Int], _ k: Int, _ n: Int) -> [Int] {
    var result = [Int]()
    var remnant = k
    var index = n - 1

    while index >= 0 || remnant > 0 {
        if index >= 0 {
            remnant += xListForm[index]
        }
        result.insert(remnant % 10, at: 0)
        remnant /= 10
        index -= 1
    }

    return result
}

func readInput() -> ([Int], Int, Int) {
    let n = Int(readLine()!)!
    let xListForm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let k = Int(readLine()!)!
    return (xListForm, k, n)
}

let (num, k, n) = readInput()
let result = calculateListForm(num, k, n)
print(result.map(String.init).joined(separator: " "))
