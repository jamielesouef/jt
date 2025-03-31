////
////  AuthCommandTests.swift
////  jt
////
////  Created by Jamie Le Souef on 31/3/2025.
////
//
//
//import Testing
//@testable import jt
//
//struct AuthCommandTests {
//    @Test func loginTokenParsing() throws {
//        let command = try JTTool.Auth.Login.parse(["--token", "ghp_test"])
//        #expect(command.token == "ghp_test")
//    }
//    
//    @Test func keychainIntegration() throws {
//        try KeychainManager.save(token: "test_token")
//        let token = try KeychainManager.load()
//        #expect(token == "test_token")
//        
//        try KeychainManager.delete()
//        #expect(try KeychainManager.load() == nil)
//    }
//}
