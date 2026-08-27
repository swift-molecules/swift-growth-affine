// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-growth-affine",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Growth Affine",
            targets: ["Growth Affine"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-growth.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-affine.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Growth Affine",
            dependencies: [
                .product(name: "Growth", package: "swift-growth"),
                .product(name: "Affine", package: "swift-affine"),
            ]
        ),
        .testTarget(
            name: "Growth Affine Tests",
            dependencies: [
                "Growth Affine",
                .product(name: "Growth", package: "swift-growth"),
                .product(name: "Affine", package: "swift-affine"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = [
        .enableExperimentalFeature("RawLayout")
    ]

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
