//
//  EfficientQuickSort.swift
//

/*
 -- ПРИНЦИП РАБОТЫ --
 Алгоритм использует in-place quick sort для сортировки массива участников. Он выбирает опорный элемент (pivot) и разделяет массив на две части:
 одна часть содержит элементы, не превосходящие опорный элемент, другая - элементы, большие опорного элемента. Затем рекурсивно вызывает
 quickSort для каждой из частей. Для разделения массива используется два указателя (left и right), которые передвигаются навстречу друг другу,
 обменивая элементы, пока не встретятся. Этот процесс повторяется рекурсивно до тех пор, пока массив не будет отсортирован.

 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм корректен, так как при каждой итерации опорный элемент оказывается на правильной позиции, и все элементы, меньшие опорного,
 находятся слева, а большие - справа. Рекурсивные вызовы продолжают этот процесс для подмассивов, пока они не станут базовыми случаями (содержат
 один или ноль элементов), что гарантирует корректную сортировку всего массива.

 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 Средний случай: O(n log n), так как при каждом шаге массив делится примерно на две равные части.
 Худший случай: O(n^2), если массив уже отсортирован или отсортирован в обратном порядке и выбор опорного элемента оказывается неудачным.

 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность составляет O(log n) в среднем случае из-за глубины рекурсивных вызовов. В худшем случае она может достигать O(n),
 когда каждый шаг делит массив на одну очень маленькую и одну очень большую часть. Алгоритм работает in-place, так как использует лишь
 незначительное количество дополнительной памяти для указателей и переменных.
 */

import Foundation

struct Contestant {
  let login: String
  let tasks: Int
  let fine: Int
}

func quickSort(_ array: inout [Contestant], low: Int, high: Int) {
  if low < high {
    let pivotIndex = partition(&array, low: low, high: high)
    quickSort(&array, low: low, high: pivotIndex - 1)
    quickSort(&array, low: pivotIndex + 1, high: high)
  }
}

func partition(_ array: inout [Contestant], low: Int, high: Int) -> Int {
  let pivot = array[high]
  var left = low
  var right = high - 1

  while left <= right {
    while left <= right && compare(array[left], pivot) {
      left += 1
    }

    while left <= right && !compare(array[right], pivot) {
      right -= 1
    }

    if left <= right {
      array.swapAt(left, right)
      left += 1
      right -= 1
    }
  }

  array.swapAt(left, high)
  return left
}

func compare(_ a: Contestant, _ b: Contestant) -> Bool {
  if a.tasks != b.tasks {
    return a.tasks > b.tasks
  } else if a.fine != b.fine {
    return a.fine < b.fine
  } else {
    return a.login < b.login
  }
}

func quickSortParticipants(_ participants: inout [Contestant]) {
  quickSort(&participants, low: 0, high: participants.count - 1)
}

let n = Int(readLine()!)!
var participants = [Contestant]()

for _ in 0..<n {
  let input = readLine()!.split(separator: " ")
  let login = String(input[0])
  let tasks = Int(input[1])!
  let fine = Int(input[2])!
  participants.append(Contestant(login: login, tasks: tasks, fine: fine))
}

quickSortParticipants(&participants)

for participant in participants {
  print(participant.login)
}

