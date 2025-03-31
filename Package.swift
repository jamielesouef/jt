// swift-tools-version:5.10
import PackageDescription

let package = Package(
  name: "jt",
  platforms: [.macOS(.v13)], // Testing requires macOS 13+
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
    .package(url: "https://github.com/onevcat/Rainbow", from: "4.0.0"),
    .package(url: "https://github.com/apple/swift-testing", from: "0.3.0")
    
  ],
  targets: [
    .executableTarget(
      name: "jt",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "Rainbow", package: "Rainbow")
      ],
      path: "Sources",
      swiftSettings: [
        .unsafeFlags(["-parse-as-library"]) // Add this line
      ]
    ),
    .testTarget(
      name: "JTTests",
      dependencies: [
        "jt",
        .product(name: "Testing", package: "swift-testing")
      ],
      path: "Tests"
    )
  ]
)
