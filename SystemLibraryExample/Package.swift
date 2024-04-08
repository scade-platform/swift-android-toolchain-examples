// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SystemLibraryExample",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SystemLibraryExample",
            targets: ["SystemLibraryExample"]
        ),
        .library(
            name: "SystemLibraryExampleDynamic",
            type: .dynamic,
            targets: ["SystemLibraryExample"]
        )
    ],
    targets: [
        .systemLibrary(
            name: "foo"
        ),
        .target(
            name: "SystemLibraryExample",
            dependencies: [
                .target(name: "foo")
            ]
        )
    ]
)
