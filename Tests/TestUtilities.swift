@testable import jt

extension JTTool.GitRepositorySearch {
    static func formatResults(_ json: [[String: String]], verbose: Bool) -> String {
        var output = ""
        for repo in json {
            let name = repo["name"] ?? ""
            output += "\(name)\n"
            if verbose {
                output += "\(repo["description"] ?? "")\n"
            }
            output += "\(repo["url"] ?? "")\n"
        }
        return output
    }
}
