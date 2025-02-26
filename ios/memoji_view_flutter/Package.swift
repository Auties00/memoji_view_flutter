// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "memoji_view_flutter",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "memoji-view-flutter", targets: ["memoji_view_flutter"])
    ],
    dependencies: [
        .package(url: "https://github.com/emrearmagan/MemojiView", from: "0.0.2")
    ],
    targets: [
        .target(
            name: "memoji_view_flutter",
            dependencies: [],
            resources: []
        )
    ],
    swiftLanguageVersions: [.v5]
)
