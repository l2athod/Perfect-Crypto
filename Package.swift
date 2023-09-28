// swift-tools-version:5.1
//
//  Package.swift
//  PerfectCrypto
//
//  Created by Kyle Jessup on 2017-02-07.
//	Copyright (C) 2017 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2017 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PackageDescription

#if os(Linux)
	let cOpenSSLRepo = "https://github.com/PerfectlySoft/Perfect-COpenSSL-Linux.git"
#else
	let cOpenSSLRepo = "https://github.com/l2athod/Perfect-COpenSSL.git"
#endif

let package = Package(
    name: "PerfectCrypto",
	products: [
		.library(name: "PerfectCrypto", targets: ["PerfectCrypto"])
	],
    dependencies: [
		.package(url: "https://github.com/l2athod/PerfectLib.git", from: "1.0.0"),
		.package(url: "https://github.com/l2athod/Perfect-Thread.git", from: "1.0.0"),
		.package(url: cOpenSSLRepo, from: "1.0.0")
	],
	targets: [
		.target(name: "PerfectCrypto", dependencies: ["PerfectLib", "PerfectThread", "COpenSSL"]),
		.testTarget(name: "PerfectCryptoTests", dependencies: ["PerfectCrypto"])
	]
)
