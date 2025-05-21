// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "SocialRange",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "SocialRange", targets: ["SocialRange"])
    ],
    targets: [
        .target(
            name: "SocialRange",
            path: "SocialRange"
        )
    ]
)
