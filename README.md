# SwiftUI Typography Utils

<!-- Header Logo -->

<!-- <div align="center">
   <img width="600px" src="./Extras/banner-logo.png" alt="Banner Logo">
</div> -->


<!-- Badges -->

<p>
    <img src="https://img.shields.io/badge/Swift-5.6-F06C33.svg" />
    <img src="https://img.shields.io/badge/iOS-14.0+-865EFC.svg" />
    <img src="https://img.shields.io/badge/iPadOS-14.0+-F65EFC.svg" />
    <img src="https://img.shields.io/badge/macOS-11.0+-179AC8.svg" />
    <img src="https://img.shields.io/badge/tvOS-14.0+-41465B.svg" />
    <img src="https://img.shields.io/badge/watchOS-7.0+-1FD67A.svg" />
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" />
    <img src="https://github.com/CypherPoet/SwiftUITypographyUtils/workflows/Build%20&%20Test/badge.svg" />
    <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" />
    </a>
    <a href="https://twitter.com/cypher_poet">
        <img src="https://img.shields.io/badge/Contact-@cypher_poet-lightgrey.svg?style=flat" alt="Twitter: @cypher_poet" />
    </a>
</p>


<p align="center">

_Utilities for typographic tailoring in SwiftUI._

<p />



## Installation

### Xcode Projects

Select `File` -> `Swift Packages` -> `Add Package Dependency` and enter `https://github.com/CypherPoet/SwiftUITypographyUtils`.



### Swift Package Manager Projects

You can add this project as a package dependency in your `Package.swift` file:

```swift
let package = Package(
    //...
    dependencies: [
        .package(
            url: "https://github.com/CypherPoet/SwiftUITypographyUtils",
            .upToNextMinor(from: .init(0, 3, 0))
        ),
    ],
    //...
)
```

From there, refer to the `SwiftUITypographyUtils` "product" delivered by the `CypherPoetSwiftUITypographyUtils` "package" inside of any of your project's target dependencies:

```swift
targets: [
    .target(
        name: "YourLibrary",
        dependencies: [
            .product(name: "SwiftUITypographyUtils", package: "CypherPoetSwiftUITypographyUtils"),
        ],
        ...
    ),
    ...
]
```

Then simply `import SwiftUITypographyUtils` wherever you’d like to use it.



## Contributing

Contributions to `SwiftUITypographyUtils` are most welcome. Check out some of the [issue templates](./.github/ISSUE_TEMPLATE/) for more info.



## 💻 Developing

### Requirements

- Xcode 13.0+ (Recommended)


### 📜 Creating & Building Documentation

Documentation is built with [Xcode's DocC](https://developer.apple.com/documentation/docc). More details are forthcoming here -- but for now,  see [Apple's guidance on how to build, run, and create DocC content](https://developer.apple.com/documentation/docc/api-reference-syntax).



## 🏷 License

`SwiftUITypographyUtils` is available under the MIT license. See the [LICENSE file](./LICENSE) for more info.
