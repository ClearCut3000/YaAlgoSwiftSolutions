
  HashTable.swift

/*
 -- ПРИНЦИП РАБОТЫ --
 Алгоритм реализует хеш-таблицу для хранения данных сотрудников с их зарплатами. Хеш-таблица использует метод цепочек для разрешения коллизий.
 При добавлении элемента (put key value) вычисляется хеш ключа, и элемент добавляется в соответствующую цепочку (список) по полученному индексу.
 При запросе значения по ключу (get key) снова вычисляется хеш ключа, затем происходит поиск элемента в соответствующей цепочке. При удалении ключа
 (delete key) элемент удаляется из цепочки, соответствующей хешу ключа.

 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм корректно обрабатывает все операции благодаря стратегии хеш-таблицы с методом цепочек. Каждый элемент добавляется, ищется и удаляется
 в правильной цепочке, что гарантирует корректность операций.

 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 В среднем случае все операции (put, get, delete) выполняются за время O(1), так как каждая операция сводится к константному времени на операции
 с элементами цепочек (списков). В худшем случае, когда все ключи коллизируют, временная сложность может составить O(n), где n - количество элементов.

 Время инициализации хеш-таблицы зависит от размера таблицы и занимает O(m), где m - емкость таблицы (capacity). Это время затрачивается на
 создание массива указанного размера и его инициализацию значениями по умолчанию (nil). Если количество операций с хеш-таблицей невелико,
 это время может существенно повлиять на общую временную сложность. 
 В реальных условиях время инициализации хеш-таблицы с емкостью например 100003 элемента является небольшим по сравнению с временем выполнения операций вставки,
 поиска и удаления в больших объемах данных.
 В случаях, когда операций очень много, время инициализации становится незначительным по сравнению с суммарным временем выполнения всех операций.

 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность в среднем случае составляет O(n), где n - количество добавленных элементов, так как необходимо хранить структуру данных (массив списков и элементы в них).
 Размер массива определяется только начальным состоянием (capacity). Элементов может быть добавлено как меньше, так и существенно больше (за счет удаления и повторного добавления).
 */


import Foundation

class QueryProcessor {
  private let hashTable = HashTable()

  init() {
    processQueries()
  }

  private func processQueries() {
    let n = Int(readLine()!)!
    var results = [String]()

    for _ in 0..<n {
      let query = readLine()!
      let parts = query.split(separator: " ").map { String($0) }
      let operation = parts[0]
      let key = Int(parts[1])!

      switch operation {
      case "put":
        let value = Int(parts[2])!
        hashTable.put(key: key, value: value)
      case "get":
        if let value = hashTable.get(key: key) {
          results.append("\(value)")
        } else {
          results.append("None")
        }
      case "delete":
        if let value = hashTable.delete(key: key) {
          results.append("\(value)")
        } else {
          results.append("None")
        }
      default:
        break
      }
    }

    for result in results {
      print(result)
    }
  }
}

class HashTable {
  private class Node {
    let key: Int
    var value: Int
    var next: Node?

    init(key: Int, value: Int) {
      self.key = key
      self.value = value
      self.next = nil
    }
  }

  private var table: [Node?]
  private let capacity = 100003

  init() {
    table = Array(repeating: nil, count: capacity)
  }

  private func hash(_ key: Int) -> Int {
    return abs(key) % capacity
  }

  func put(key: Int, value: Int) {
    let index = hash(key)
    let newNode = Node(key: key, value: value)
    if table[index] == nil {
      table[index] = newNode
    } else {
      var currentNode = table[index]
      while currentNode != nil {
        if currentNode!.key == key {
          currentNode!.value = value
          return
        }
        currentNode = currentNode!.next
      }
      newNode.next = table[index]
      table[index] = newNode
    }
  }

  func get(key: Int) -> Int? {
    let index = hash(key)
    var currentNode = table[index]
    while currentNode != nil {
      if currentNode!.key == key {
        return currentNode!.value
      }
      currentNode = currentNode!.next
    }
    return nil
  }

  func delete(key: Int) -> Int? {
    let index = hash(key)
    var currentNode = table[index]
    var prevNode: Node? = nil
    while currentNode != nil {
      if currentNode!.key == key {
        let value = currentNode!.value
        if prevNode == nil {
          table[index] = currentNode!.next
        } else {
          prevNode!.next = currentNode!.next
        }
        return value
      }
      prevNode = currentNode
      currentNode = currentNode!.next
    }
    return nil
  }
}

_ = QueryProcessor()
