
  SearchEngine.swift

/*
 -- ПРИНЦИП РАБОТЫ --
 Алгоритм построения поискового индекса на основе входных документов использует хеш-таблицу для хранения частот встречаемости каждого слова в каждом документе.
 При добавлении документа происходит разделение его на отдельные слова, которые затем добавляются в хеш-таблицу с указанием их частоты в данном документе.
 При поиске по запросу для каждого уникального слова из запроса происходит поиск его частот в хеш-таблице и вычисление релевантности каждого документа,
 как суммы частот вхождений всех слов запроса. Результаты сортируются по убыванию релевантности, а при равной релевантности - по возрастанию порядковых номеров документов.

 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм корректно обрабатывает добавление и поиск документов благодаря использованию хеш-таблицы, которая обеспечивает быстрый доступ и обновление данных.
 При добавлении документа каждое слово корректно учитывается в хеш-таблице с указанием частоты вхождения в документе. При поиске по запросу для каждого слова
 из запроса вычисляется суммарная релевантность каждого документа, учитывая частоту вхождений всех слов запроса в этот документ. Сортировка результатов
 обеспечивает правильное упорядочивание документов по убыванию релевантности и по возрастанию их порядковых номеров при равной релевантности.

 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 Добавление документа выполняется за время, пропорциональное количеству символов в документе. Поиск по запросу требует времени,
 пропорционального количеству уникальных слов в запросе, умноженному на количество документов, в которых упоминается каждое слово.
 Следовательно, временная сложность в худшем случае для поиска и добавления оценивается как O(n), где n - количество символов в документе или запросе.
 Дополнительно, сортировка результатов по релевантности и порядковому номеру документа имеет временную сложность O(d log d), где d - количество документов.

 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность в среднем случае зависит от количества уникальных слов во всех добавленных документах и их частоты встречаемости в документах.
 Она оценивается как O(m * k), где m - количество уникальных слов в документах, а k - количество документов, в которых встречается каждое слово. Алгоритм
 использует дополнительную память только для хранения хеш-таблицы и некоторых вспомогательных переменных, поэтому он работает с минимальным потреблением памяти.
 */

import Foundation

struct Document {
  let id: Int
  var relevance: Int
}

class SearchEngine {
  private var wordToDocumentFrequencies = [String: [Int: Int]]()

  func indexDocument(id: Int, line: String) {
      let words = line.split(separator: " ").map { String($0) }

      for word in words {
          if wordToDocumentFrequencies[word] == nil {
              wordToDocumentFrequencies[word] = [:]
          }
          wordToDocumentFrequencies[word]![id, default: 0] += 1
      }
  }

  func searchTopDocuments(query: String) -> [Document] {
    var documents = [Document]()
    var relevanceMap = [Int: Int]()
    let queryWords = Set(query.split(separator: " ").map { String($0) })

    for word in queryWords {
      if let docFreq = wordToDocumentFrequencies[word] {
        for (docID, count) in docFreq {
          relevanceMap[docID, default: 0] += count
        }
      }
    }

    for (id, relevance) in relevanceMap {
      documents.append(Document(id: id, relevance: relevance))
    }

    documents.sort {
      if $0.relevance == $1.relevance {
        return $0.id < $1.id
      }
      return $0.relevance > $1.relevance
    }

    return Array(documents.prefix(5))
  }
}

class DocumentProcessor {
  private var searchEngine = SearchEngine()

  init() {
    processInput()
  }

  private func processInput() {
    guard let n = Int(readLine()!) else { return }

    for i in 1...n {
      if let line = readLine() {
        searchEngine.indexDocument(id: i, line: line)
      }
    }

    guard let m = Int(readLine()!) else { return }

    for _ in 0..<m {
      if let line = readLine() {
        let documents = searchEngine.searchTopDocuments(query: line)
        let result = documents.map { String($0.id) }.joined(separator: " ")
        print(result)
      }
    }
  }
}

let processor = DocumentProcessor()
