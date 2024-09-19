//
//  Deck.swift
//

/*
 -- ПРИНЦИП РАБОТЫ --
 Мы используем кольцевой буфер для хранения элементов дека. Это позволяет эффективно использовать память и выполнять все операции за O(1).
 Для хранения данных используется массив фиксированного размера. Мы обходим массив по кругу, используя индекс head.
 head указывает на первый элемент в деке. Индекс tail вычисляется динамически как (head + count) % maxSize.
 Операции добавления и удаления элементов обновляют соответствующие индексы и поддерживают количество элементов в деке.

 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм корректен, так как поддерживает все операции дека (pushFront, pushBack, popFront, popBack).
 Кольцевой буфер гарантирует, что индексы всегда остаются в пределах массива, что предотвращает выход за границы.
 Проверки на переполнение и опустошение буфера обеспечивают корректность операций добавления и удаления элементов.

 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 Все операции (pushFront, pushBack, popFront, popBack) выполняются за O(1) благодаря использованию указателей и кольцевого буфера.

 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность алгоритма составляет O(maxSize), где maxSize — максимальный размер дека. Буфер фиксированного размера используется для хранения элементов дека.
 */

import Foundation

class Deque {
  private var deque: [Int]
  private var head: Int
  private var count: Int
  private var maxSize: Int

  init(_ maxSize: Int) {
    self.maxSize = maxSize
    self.deque = Array(unsafeUninitializedCapacity: maxSize) { buffer, initializedCount in
      for i in 0..<maxSize {
        buffer[i] = 0
      }
      initializedCount = maxSize
    }
    self.head = 0
    self.count = 0
  }

  private var tail: Int {
    return (head + count) % maxSize
  }

  func pushFront(_ value: Int) -> String {
    guard count < maxSize else {
      return "error"
    }
    head = (head - 1 + maxSize) % maxSize
    deque[head] = value
    count += 1
    return ""
  }

  func pushBack(_ value: Int) -> String {
    guard count < maxSize else {
      return "error"
    }
    deque[tail] = value
    count += 1
    return ""
  }

  func popFront() -> String {
    guard count > 0 else {
      return "error"
    }
    let value = deque[head]
    head = (head + 1) % maxSize
    count -= 1
    return "\(value)"
  }

  func popBack() -> String {
    guard count > 0 else {
      return "error"
    }
    let tailIndex = (tail - 1 + maxSize) % maxSize
    let value = deque[tailIndex]
    count -= 1
    return "\(value)"
  }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let deque = Deque(m)

for _ in 0..<n {
  let command = readLine()!.split(separator: " ")
  let operation = String(command[0])

  switch operation {
  case "push_front":
    let value = Int(command[1])!
    let result = deque.pushFront(value)
    if result != "" {
      print(result)
    }
  case "push_back":
    let value = Int(command[1])!
    let result = deque.pushBack(value)
    if result != "" {
      print(result)
    }
  case "pop_front":
    let result = deque.popFront()
    print(result)
  case "pop_back":
    let result = deque.popBack()
    print(result)
  default:
    break
  }
}
