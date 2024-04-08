// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BinaryTargetExample",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BinaryTargetExample",
            targets: ["BinaryTargetExample"]
        ),
        .library(
            name: "BinaryTargetExampleDynamic",
            type: .dynamic,
            targets: ["BinaryTargetExample"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "foo",
            path: "libfoo/build/foo.xcframework"
        ),
        .target(
            name: "BinaryTargetExample",
            dependencies: [
                .target(name: "foo")
            ]
        )
    ]
)
