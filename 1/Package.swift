// swift-tools-version:5.7
import PackageDescription

let package = Package(
  name: "day1",
  products: [
    .executable(name: "day1", targets: ["day1"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-algorithms", from: "1.0.0")
  ],
  targets: [
    .executableTarget(name: "day1", dependencies: [
        .product(name: "Algorithms", package: "swift-algorithms"),
      ]
    ),
  ]
)