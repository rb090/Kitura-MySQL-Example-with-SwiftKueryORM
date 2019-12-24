// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KituraOrmMySQL",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMajor(from: "2.9.1")),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", .upToNextMajor(from: "1.9.0")),
        .package(url: "https://github.com/IBM-Swift/SwiftKueryMySQL.git", .upToNextMajor(from: "2.0.2")),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery.git", .upToNextMajor(from: "3.0.1")),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", .upToNextMajor(from: "0.6.1"))
    ],
    
    targets: [
        .target(name: "KituraOrmMySQL", dependencies: ["Kitura" , "HeliumLogger", "SwiftKueryMySQL", "SwiftKuery", "SwiftKueryORM"],  path: "Sources")
    ]
)
