//
//  Semver.swift
//  Semver
//
//  Created by 南　京兵 on 2016/10/14.
//  Copyright © 2016年 南　京兵. All rights reserved.
//

import UIKit

class Semver: NSObject {
    
    public var major: Int
    public var minor: Int
    public var patch: Int
    
    override init() {
        self.major = 0
        self.minor = 0
        self.patch = 0
    }
    
    convenience init(major:Int, minor:Int , patch:Int) {
        self.init()
        self.major = major
        self.minor = minor
        self.patch = patch
    }
    
    func versionString() -> String {
        return "\
        (major).\(minor).\(patch)"
    }
    
    func isEqualVersion(semver2:Semver) -> Bool {
        return self.versionString() == semver2.versionString()
    }

    func isSmallVersion(semver2: Semver) -> Bool {
        return self.versionString() < semver2.versionString()
    }
    
    func isBigVersion(semver2: Semver) -> Bool {
        return self.versionString() > semver2.versionString()
    }
}
