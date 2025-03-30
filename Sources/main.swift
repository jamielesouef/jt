// main.swift - No shebang line needed for SPM projects

import Foundation
import ArgumentParser

@main
struct JTTool: ParsableCommand {
  static let configuration = CommandConfiguration(
    commandName: "jt",
    abstract: "A powerful GitHub repository search tool",
    subcommands: [Search.self],
    defaultSubcommand: Search.self
  )
}
