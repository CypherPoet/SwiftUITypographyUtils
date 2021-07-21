// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CypherPoetSwiftUITypographyUtils",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftUITypographyUtils",
            targets: [
                "SwiftUITypographyUtils",
            ]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftUITypographyUtils",
            dependencies: [
            ],
            path: "Sources/SwiftUITypographyUtils/"
        ),
        .testTarget(
            name: "SwiftUITypographyUtilsTests",
            dependencies: [
                "SwiftUITypographyUtils",
            ],
            path: "Tests/SwiftUITypographyUtils/",
            exclude: [
                "Data/README.md",
                "Toolbox/README.md",
            ],
            resources: [
                .process("Data"),
                .process("Resources"),
            ]
        ),
    ]
)
