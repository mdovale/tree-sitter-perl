// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TreeSitterPerl",
    products: [
        .library(name: "TreeSitterPerl", targets: ["TreeSitterPerl"]),
    ],
    dependencies: [
        .package(name: "SwiftTreeSitter", url: "https://github.com/tree-sitter/swift-tree-sitter", from: "0.9.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterPerl",
            dependencies: [],
            path: ".",
            exclude: [
                "binding.gyp",
                "bindings/c",
                "bindings/go",
                "bindings/node",
                "bindings/python",
                "bindings/rust",
                "Cargo.toml",
                "CMakeLists.txt",
                "cpanfile",
                "copy-to-release",
                "go.mod",
                "grammar.js",
                "generate_keywords.pl",
                "unicode_ranges.pl",
                "lib",
                "LICENSE",
                "Makefile",
                "package-lock.json",
                "package.json",
                "pyproject.toml",
                "README.md",
                "script",
                "setup.py",
                "src/grammar.json",
                "src/node-types.json",
                "test",
                "tree-sitter-perl.pc",
                "tree-sitter.json",
                ".clang-format",
                ".editorconfig",
                ".eslintrc.cjs",
                ".github",
            ],
            sources: [
                "src/parser.c",
                "src/scanner.c",
            ],
            resources: [
                .copy("queries"),
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")],
        ),
        .testTarget(
            name: "TreeSitterPerlTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterPerl",
            ],
            path: "bindings/swift/TreeSitterPerlTests",
        ),
    ],
    cLanguageStandard: .c11,
)
