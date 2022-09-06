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
    dependencies: [
        .package(
            url: "https://github.com/realm/realm-swift.git",
            .exact("10.25.0")
        ),
        .package(
            url: "https://github.com/apollographql/apollo-ios",
            from: "0.51.2"
        ),
        .package(
            url: "https://github.com/Alamofire/Alamofire.git",
            from: "5.5.0"
        ),
        .package(
            url: "https://github.com/Alamofire/AlamofireImage.git",
            from: "4.2.0"
        ),
        .package(
            url: "https://github.com/matomo-org/matomo-sdk-ios.git",
            from: "7.5.0"
        ),
        .package(
            url: "https://github.com/xmartlabs/XLActionController",
            from: "5.1.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "GI40Lib",
            path: "./Sources/GI40Lib.xcframework"
        )
    ]
)
