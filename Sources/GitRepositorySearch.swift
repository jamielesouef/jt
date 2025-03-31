//
//  Search.swift
//  jt
//
//  Created by Jamie Le Souef on 28/3/2025.
//

import Foundation
import ArgumentParser
import Rainbow

extension JTTool {
  
  struct GitRepositorySearch: ParsableCommand, ShellRunnable {
    static let configuration = CommandConfiguration(
      commandName: "g",
      abstract: "Search GitHub repositories"
    )
    
    @Option(name: .shortAndLong, help: "Search term")
    var searchTerm: String  // Changed from @Argument to @Option
    
    @Flag(name: .shortAndLong, help: "Show full output")
    var verbose = false
    
    @Option(name: .shortAndLong, help: "Limit number of results")
    var limit: Int?
    
    
    func run() throws {
      // Build GitHub CLI command
      var command = ["gh", "search", "repos", searchTerm, "--json=name,description,url"]
      
      if let limit = limit {
        command.append("--limit=\(limit)")
      }
      
      // Execute command
      let output = try shell(command)
      
      // Parse JSON output
      guard let json = try parseJSON(output) else {
        throw CleanExit.message("No results found")
      }
      
      // Print formatted results
      printResults(json: json, verbose: verbose)
    }
    
    func printResults(json: [[String: Any]], verbose: Bool) {
      print("GitHub Search Results for \"\(searchTerm)".bold)
      print(String(repeating: "=", count: 40))
      
      
      for repo in json {
        let name = repo["name"] as? String ?? "No name"
        let description = repo["description"] as? String ?? "No description"
        let url = repo["url"] as? String ?? "No URL"
        
        print("\(name)".cyan.bold)
        
        if verbose {
          print("Description: \(description)")
        }
        
        print(url)
        
      }
      
      print("\nFound \(json.count) repositories".bold)
    }
  }
}
