//
//  PackedPrefix.swift
//
/*
 -- ПРИНЦИП РАБОТЫ --
 Алгоритм решает задачу нахождения наибольшего общего префикса среди запакованных строк с использованием последовательной распаковки. Каждая строка может содержать как обычные символы, так и конструкции вида n[A], где A — строка, которая повторяется n раз. Алгоритм обеспечивает эффективную обработку этих строк, не храня их все в памяти.
 Алгоритм работает в три этапа:
 1. Распаковка строки: При каждом вводе строка распаковывается с помощью стековой структуры. Символы добавляются в текущую строку, а конструкции вида n[...] обрабатываются с использованием стека для сохранения текущего состояния строки и числа повторений. Это позволяет эффективно обрабатывать вложенные конструкции.
 2. Последовательное сравнение строк: Алгоритм последовательно читает и распаковывает строки, обновляя минимальную и максимальную строки. Таким образом, вместо хранения всех распакованных строк, мы сразу сравниваем каждую строку с текущими минимальной и максимальной строками.
 3. Нахождение общего префикса: После того как все строки были последовательно обработаны, алгоритм находит общий префикс между минимальной и максимальной строками. Поскольку общий префикс для всех строк всегда является подстрокой общего префикса минимальной и максимальной строк, это решение является эффективным.

 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм корректен, так как каждая строка распаковывается по правилам, описанным для конструкции n[A]. Использование стека позволяет обрабатывать вложенные конструкции и повторения корректно. Так как минимальная и максимальная строки последовательно обновляются, мы гарантируем, что на выходе будет найден наибольший общий префикс между всеми распакованными строками.

 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 Временная сложность алгоритма состоит из двух основных частей:
 1. Распаковка строк: Пусть n — количество строк, а L — суммарная длина всех распакованных строк. Каждая строка распаковывается посимвольно с использованием стека, поэтому сложность распаковки каждой строки составляет O(L).
 2. Нахождение общего префикса: Общий префикс ищется между минимальной и максимальной строками. Это операция выполняется за время, пропорциональное длине этих строк, что также даёт O(L).
 Итоговая временная сложность алгоритма — O(L), где L — суммарная длина всех распакованных строк.

 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность алгоритма ограничена двумя строками — минимальной и максимальной, а также стеком для распаковки текущей строки. Таким образом, не требуется хранить все строки в памяти, и сложность памяти составляет O(M + N), где M и N — длины минимальной и максимальной строк. Стек для распаковки использует память, пропорциональную глубине вложенности конструкции n[A], что не увеличивает общую сложность.
 */

import Foundation

// Интерфейс для распаковки строк
protocol UnpackerProtocol {
  func unpack(_ s: String) -> String
}

// Класс для распаковки строк с поддержкой вложенных структур
class StringUnpacker: UnpackerProtocol {
  func unpack(_ s: String) -> String {
    var stack: [String] = []
    var currentString = ""
    var numBuffer = ""

    for char in s {
      if char.isNumber {
        numBuffer.append(char)
      } else if char == "[" {
        stack.append(currentString)
        stack.append(numBuffer)
        currentString = ""
        numBuffer = ""
      } else if char == "]" {
        let num = Int(stack.removeLast()) ?? 1
        let prevString = stack.removeLast()
        currentString = prevString + String(repeating: currentString, count: num)
      } else {
        currentString.append(char)
      }
    }

    return currentString
  }
}

// Класс для последовательного поиска минимальной и максимальной строки
class SequentialMinMaxFinder {
  private let unpacker: UnpackerProtocol

  init(unpacker: UnpackerProtocol) {
    self.unpacker = unpacker
  }

  func findMinMaxCommonPrefix(_ n: Int) -> String {
    guard n > 0 else { return "" }

    var minStr: String? = nil
    var maxStr: String? = nil

    for _ in 0..<n {
      if let packedString = readLine() {
        let unpackedString = unpacker.unpack(packedString)

        if minStr == nil || unpackedString < minStr! {
          minStr = unpackedString
        }
        if maxStr == nil || unpackedString > maxStr! {
          maxStr = unpackedString
        }
      }
    }

    // Проверка на наличие строк
    guard let minString = minStr, let maxString = maxStr else {
      return ""
    }

    // Поиск общего префикса между min и max
    return minString.commonPrefix(with: maxString, options: [])
  }
}

// Класс для обработки ввода и вызова поиска
class StringProcessor {
  private let minMaxFinder: SequentialMinMaxFinder

  init(minMaxFinder: SequentialMinMaxFinder) {
    self.minMaxFinder = minMaxFinder
  }

  func processStrings() {
    guard let n = Int(readLine()!) else {
      print("")
      return
    }

    let result = minMaxFinder.findMinMaxCommonPrefix(n)
    print(result)
  }
}

func main() {
  let unpacker = StringUnpacker()
  let minMaxFinder = SequentialMinMaxFinder(unpacker: unpacker)
  let stringProcessor = StringProcessor(minMaxFinder: minMaxFinder)

  stringProcessor.processStrings()
}

main()
