 //
//  SearchCommandTests.swift
//  jt
//
//  Created by Jamie Le Souef on 31/3/2025.
//


import Testing
@testable import jt

struct SearchCommandTests {
    @Test func basicSearchParsing() async throws {
        let command = try JTTool.GitRepositorySearch.parse([
            "-s", "SwiftUI",
            "--limit", "5"
        ])
        
        #expect(command.searchTerm == "SwiftUI")
        #expect(command.limit == 5)
        #expect(command.verbose == false)
    }
    
    @Test func missingSearchTermThrows() {
        #expect(throws: (any Error).self) {
            try JTTool.GitRepositorySearch.parse([])
        }
    }
    
    @Test func outputFormatting() {
        let mockRepo = [
            "name": "AwesomeProject",
            "description": "A test repo",
            "url": "https://github.com/test/repo"
        ]
        
        let output = JTTool.GitRepositorySearch.formatResults([mockRepo], verbose: true)
        #expect(output.contains("AwesomeProject"))
        #expect(output.contains("https://github.com/test/repo"))
        #expect(output.contains("A test repo"))
    }
}
