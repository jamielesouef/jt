//
//  File.swift
//  jt
//
//  Created by Jamie Le Souef on 31/3/2025.
//

import Foundation

protocol ShellRunnable {
  func run() throws
  func shell(_ args: [String]) throws -> String
  func printResults(json: [[String: Any]], verbose: Bool)
  func parseJSON(_ jsonString: String) throws -> [[String: Any]]?
}

extension ShellRunnable {
  func shell(_ args: [String]) throws -> String {
    let process = Process()
    let pipe = Pipe()
    
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = args
    process.standardOutput = pipe
    
    try process.run()
    process.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    return String(data: data, encoding: .utf8) ?? ""
  }
  
  func parseJSON(_ jsonString: String) throws -> [[String: Any]]? {
    guard let data = jsonString.data(using: .utf8) else { return nil }
    return try JSONSerialization.jsonObject(with: data) as? [[String: Any]]
  }
}
