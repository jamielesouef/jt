// swift-tools-version:5.7
import PackageDescription

let package = Package(
  name: "jt",
  platforms: [
    .macOS(.v12) // Monterey+ for async/await
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-argument-parser",
      from: "1.2.0"
    ),
    .package(
      url: "https://github.com/onevcat/Rainbow",
      from: "4.0.0"
    )
  ],
  targets: [
    .executableTarget(
      name: "jt",
      dependencies: [
        .product(
          name: "ArgumentParser",
          package: "swift-argument-parser"
        ),
        .product(
          name: "Rainbow",
          package: "Rainbow"
        )
      ],
      path: "Sources",
      swiftSettings: [
        .unsafeFlags(["-parse-as-library"])
      ]
    ),
    .testTarget(
      name: "jtTests",
      dependencies: ["jt"],
      path: "Tests"
    )
  ]
)
