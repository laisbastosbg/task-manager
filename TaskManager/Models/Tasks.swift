//
//  Tasks.swift
//  TaskManager
//
//  Created by Lais Godinho on 14/03/22.
//

import Foundation

class Tasks {
  
  func getById() -> String {
    
  }
  
  func getAll() -> [String] {
    let fileManager = FileManager.default

    func getDocumentsDiretory() -> URL {
      return fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    let fileURL = getDocumentsDiretory()
      .appendingPathComponent("tasks.txt")

    var todos = ""

    do {
      todos = try String.init(contentsOf: fileURL)
    } catch {
      
      fileManager.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
      
      do {
        todos = try String.init(contentsOf: fileURL)
      } catch {
        print("não foi possivel ler o arquivo :(")
      }
    }

    var todosArray = todos.components(separatedBy: ",")
    todosArray.removeLast()
    
    return todosArray
  }
}
