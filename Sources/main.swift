import Foundation
import ArgumentParser

@main
struct JTTool: ParsableCommand {
  static let configuration = CommandConfiguration(
    commandName: "jt",
    abstract: "A powerful GitHub repository search tool",
    subcommands: [GitRepositorySearch.self],
    defaultSubcommand: GitRepositorySearch.self
  )
}
