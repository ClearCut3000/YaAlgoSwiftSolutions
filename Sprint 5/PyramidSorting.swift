//
//  PyramidSorting.swift
//
/*
 -- ПРИНЦИП РАБОТЫ --
 Алгоритм использует сортировку кучей (HeapSort) для сортировки массива участников. Строится минимальная куча, затем элементы извлекаются
 из кучи и вставляются обратно в массив, обеспечивая сортировку по возрастанию. В процессе сортировки используется компаратор,
 который сравнивает участников по количеству решённых задач, штрафу и логину.

 Компаратор сравнивает два элемента следующим образом:
 - Если количество решённых задач у двух участников различается, меньший элемент тот, у кого решённых задач меньше.
 - Если количество решённых задач одинаково, меньший элемент тот, у кого штраф больше.
 - Если и количество решённых задач, и штраф одинаковы, меньший элемент тот, у кого логин идёт позже в алфавитном порядке.

 Таким образом, компаратор определяет построение минимальной кучи на основе этих правил.

 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм корректен, так как каждая операция просеивания (sift down) размещает элемент на правильной позиции в куче,
 обеспечивая свойство минимальной кучи. В процессе сортировки элементы извлекаются в порядке возрастания, что гарантирует правильную сортировку массива.
 Использование компаратора обеспечивает корректное сравнение участников согласно заданным правилам.

 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 Построение кучи занимает O(n) времени. Каждая операция извлечения элемента из кучи требует O(log n) времени,
 поэтому сортировка всех элементов занимает O(n log n) времени.

 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность составляет O(1), так как алгоритм работает in-place и не требует дополнительной памяти,
 кроме некоторого количества переменных для управления процессом сортировки.
 */

import Foundation

// Определение структуры и интерфейсов
struct Participant {
  let login: String
  let problemsSolved: Int
  let penalty: Int

  init(_ login: String, _ problemsSolved: Int, _ penalty: Int) {
    self.login = login
    self.problemsSolved = problemsSolved
    self.penalty = penalty
  }
}

protocol Comparator {
  func compare(_ a: Participant, _ b: Participant) -> Bool
}

class ParticipantComparator: Comparator {
  func compare(_ a: Participant, _ b: Participant) -> Bool {
    if a.problemsSolved != b.problemsSolved {
      return a.problemsSolved < b.problemsSolved
    }
    if a.penalty != b.penalty {
      return a.penalty > b.penalty
    }
    return a.login > b.login
  }
}

// Класс для сортировки кучи
class HeapSort {
  private var comparator: Comparator

  init(comparator: Comparator) {
    self.comparator = comparator
  }

  func sort(participants: inout [Participant]) {
    let n = participants.count
    for i in stride(from: n / 2 - 1, through: 0, by: -1) {
      siftDown(heap: &participants, idx: i, size: n)
    }

    for i in stride(from: n - 1, through: 1, by: -1) {
      participants.swapAt(0, i)
      siftDown(heap: &participants, idx: 0, size: i)
    }
  }

  private func siftDown(heap: inout [Participant], idx: Int, size: Int) {
    var idx = idx
    while 2 * idx + 1 < size {
      let left = 2 * idx + 1
      let right = 2 * idx + 2
      var j = left

      if right < size && comparator.compare(heap[right], heap[left]) {
        j = right
      }

      if comparator.compare(heap[idx], heap[j]) {
        break
      }

      heap.swapAt(idx, j)
      idx = j
    }
  }

  private func siftUp(heap: inout [Participant], idx: Int) -> Int {
    var idx = idx
    while idx > 0 {
      let parent = (idx - 1) / 2
      if comparator.compare(heap[parent], heap[idx]) {
        break
      }
      heap.swapAt(parent, idx)
      idx = parent
    }
    return idx
  }
}

// Класс для обработки входных данных и вызова сортировки
class CompetitionManager {
  private let comparator: Comparator
  private let sorter: HeapSort

  init(comparator: Comparator) {
    self.comparator = comparator
    self.sorter = HeapSort(comparator: comparator)
  }

  func run() {
    var participants = readParticipants()
    sorter.sort(participants: &participants)
    printParticipants(participants)
  }

  private func readParticipants() -> [Participant] {
    let n = Int(readLine()!)!
    var participants = [Participant]()

    for _ in 0..<n {
      let input = readLine()!.split(separator: " ")
      let login = String(input[0])
      let problemsSolved = Int(input[1])!
      let penalty = Int(input[2])!
      participants.append(Participant(login, problemsSolved, penalty))
    }

    return participants
  }

  private func printParticipants(_ participants: [Participant]) {
    for participant in participants {
      print(participant.login)
    }
  }
}

// Основной код для запуска
let comparator = ParticipantComparator()
let manager = CompetitionManager(comparator: comparator)
manager.run()

