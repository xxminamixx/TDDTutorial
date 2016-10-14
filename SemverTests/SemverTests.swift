//
//  SemverTests.swift
//  SemverTests
//
//  Created by 南　京兵 on 2016/10/14.
//  Copyright © 2016年 南　京兵. All rights reserved.
//

import XCTest
@testable import Semver

class SemverTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // 問題1
    func test_引数を3つ与えてインスタンスを生成してmajorの値を比較() {
        let semver = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertEqual(semver.major, 1)
        
    }
    
    func test_引数を3つ与えてインスタンスを生成してminorの値を比較() {
        let semver = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertEqual(semver.minor, 4)
    }
    
    func test_引数を3つ与えてインスタンスを生成してpatchの値を比較() {
        let semver = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertEqual(semver.patch, 2)
    }

    func test_バージョン文字列を出力する() {
        let semver = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertEqual(semver.versionString(), "1.4.2")
    }
    
    func test_バージョン文字列を出力する_234() {
        let semver = Semver(major: 2, minor: 3, patch: 4)
        XCTAssertEqual(semver.versionString(), "2.3.4")
    }
    
    // 問題2
    func test_バージョンの比較_同一の値で比較したら成功する() {
        let semver1 = Semver(major: 1, minor: 4, patch: 2)
        let semver2 = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertTrue(semver1.isEqualVersion(semver2: semver2))
    }

    func test_バージョンの比較_同一の値で比較したら成功する別の値() {
        let semver1 = Semver(major: 9, minor: 8, patch: 7)
        let semver2 = Semver(major: 9, minor: 8, patch: 7)
        XCTAssertTrue(semver1.isEqualVersion(semver2: semver2))
    }
    
    func test_バージョンの比較_異なる値で比較したら失敗する() {
        let semver1 = Semver(major: 1, minor: 4, patch: 2)
        let semver2 = Semver(major: 1, minor: 4, patch: 3)
        XCTAssertFalse(semver1.isEqualVersion(semver2: semver2))
    }
    
    func test_バージョンの比較_異なる値で比較したら失敗する別の値() {
        let semver1 = Semver(major: 5, minor: 6, patch: 7)
        let semver2 = Semver(major: 5, minor: 6, patch: 8)
        XCTAssertFalse(semver1.isEqualVersion(semver2: semver2))
    }
    
    // 問題3
    func test_自分と別クラスと比較してバージョンが小さいことを確認() {
        let semver1 = Semver(major: 1, minor: 4, patch: 1)
        let semver2 = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertTrue(semver1.isSmallVersion(semver2: semver2))
    }
    
    func test_自分と別クラスと比較してバージョンが小さいことを確認するけど同一() {
        let semver1 = Semver(major: 1, minor: 4, patch: 2)
        let semver2 = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertFalse(semver1.isSmallVersion(semver2: semver2))
    }
    
    func test_自分と別クラスと比較してバージョンが小さいことを確認するけど大きい() {
        let semver1 = Semver(major: 1, minor: 4, patch: 3)
        let semver2 = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertFalse(semver1.isSmallVersion(semver2: semver2))
    }

    func test_自分と別クラスと比較してバージョンが大きいことを確認() {
        let semver1 = Semver(major: 1, minor: 4, patch: 3)
        let semver2 = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertTrue(semver1.isBigVersion(semver2: semver2))
    }
    
    func test_自分と別クラスと比較してバージョンが大きいことを確認するけど同じ() {
        let semver1 = Semver(major: 1, minor: 4, patch: 2)
        let semver2 = Semver(major: 1, minor: 4, patch: 2)
        XCTAssertFalse(semver1.isBigVersion(semver2: semver2))
    }
    
    func test_自分と別クラスと比較してバージョンが大きいことを確認するけど小さい() {
        let semver1 = Semver(major: 1, minor: 4, patch: 2)
        let semver2 = Semver(major: 1, minor: 4, patch: 3)
        XCTAssertFalse(semver1.isBigVersion(semver2: semver2))
    }
}
