// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftXML",
    products: [
        .library(name: "SwiftXML", targets: ["SwiftXML"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftXML",
            dependencies: [],
            resources: [
                    // Apply platform-specific rules.
                    // For example, images might be optimized per specific platform rule.
                    // If path is a directory, the rule is applied recursively.
                    // By default, a file will be copied if no rule applies.
                    // Process file in Sources/Example/Resources/*
                .copy("Tools")
            ]
        ),
        .testTarget(
            name: "SwiftXMLTests",
            dependencies: ["SwiftXML"]),
    ]
)
