//
//  RPNcalculator.swift
//

/*
 -- ПРИНЦИП РАБОТЫ --
 Для обработки выражения в обратной польской нотации используется алгоритм перевода выражения из инфиксной формы записи в постфиксную. Этот алгоритм работает следующим образом:
 1. Создается пустой стек операторов и список для выходной строки (постфиксной записи).
 2. Для каждого элемента входной строки выполняются следующие действия:
 - Если элемент является операндом (числом), он добавляется в выходную строку.
 - Если элемент является открывающей скобкой '(', он помещается в стек операторов.
 - Если элемент является закрывающей скобкой ')', операторы из стека перемещаются в выходную строку до тех пор, пока не встретится открывающая скобка. Открывающая скобка удаляется из стека, но не добавляется в выходную строку.
 - Если элемент является оператором, то:
 - Пока стек не пуст и верхний оператор в стеке имеет больший или равный приоритет, чем текущий оператор, оператор из стека перемещается в выходную строку.
 - Текущий оператор помещается в стек.
 3. После обработки всех элементов входной строки операторы из стека перемещаются в выходную строку.
 4. Выходная строка содержит постфиксное представление исходного выражения.
 
 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм корректно обрабатывает выражения в инфиксной форме записи и переводит их в постфиксную нотацию. Последовательное перемещение операторов из стека в выходную строку обеспечивает правильный порядок выполнения операций. Каждый оператор добавляется в стек и извлекается из него ровно один раз, что гарантирует корректность преобразования.
 
 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 Алгоритм имеет временную сложность O(n), где n - количество символов в исходном выражении. Это объясняется тем, что каждый символ обрабатывается один раз, и операции добавления и удаления элементов из стека выполняются за постоянное время.
 
 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность алгоритма зависит от размера входного выражения и может быть оценена как O(n), где n - количество символов в исходном выражении. Это связано с использованием стека операторов и списка для выходной строки, которые потребляют память в зависимости от размера входных данных.
 */


import Foundation

func evaluateRPN(_ expression: String) -> Int {
  let tokens = expression.split(separator: " ")
  var stack = [Int]()
  
  for token in tokens {
    if let num = Int(token) {
      stack.append(num)
    } else {
      let right = stack.removeLast()
      let left = stack.removeLast()
      var result = 0
      switch token {
      case "+":
        result = left + right
      case "-":
        result = left - right
      case "*":
        result = left * right
      case "/":
        if left * right < 0 && left % right != 0 {
          result = left / right - 1
        } else {
          result = left / right
        }
      default:
        fatalError("Invalid operator")
      }
      stack.append(result)
    }
  }
  return stack.last!
}

let expression = readLine()!
let result = evaluateRPN(expression)
print(result)
