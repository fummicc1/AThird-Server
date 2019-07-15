// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Server",
    dependencies: [
      .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.6.0")),
      .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.1"),
      .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "9.0.0"),
      .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.0.0"),
      .package(url: "https://github.com/IBM-Swift/Kitura-WebSocket.git", from: "2.1.2")
    ],
    targets: [
      .target(name: "Server", dependencies: [ .target(name: "Application"), "Kitura" , "HeliumLogger", "Kitura-WebSocket"]),
      .target(name: "Application", dependencies: [ "Kitura", "CloudEnvironment","SwiftMetrics", "Health", "Kitura-WebSocket",
      ]),
      .testTarget(name: "ApplicationTests" , dependencies: [.target(name: "Application"), "Kitura","HeliumLogger" ])
    ]
)
