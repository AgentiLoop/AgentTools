// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "AgentTools",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "AgentTools",
            targets: ["AgentTools"]
        ),
    ],
    targets: [
        .target(
            name: "AgentTools",
            path: "Sources/AgentTools"
        ),
    ]
)
