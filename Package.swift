// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "GI40Lib",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "GI40Lib",
            targets: ["GI40Lib"])
    ],
    targets: [
        .binaryTarget(
            name: "GI40Lib",
            path: "./Sources/GI40Lib.xcframework"
        )
    ]
)
