//
//  OSLog+Extensions.swift
//  FirebaseEventLogTest
//
//  Created by 이진욱 on 2022/09/27.
//

import Foundation
import os.log

extension OSLog {
    static let subsystem = Bundle.main.bundleIdentifier!
    
    static let info = OSLog(subsystem: subsystem, category: "Info")
    static let debug = OSLog(subsystem: subsystem, category: "Debug")
    static let error = OSLog(subsystem: subsystem, category: "Error")
    static let network = OSLog(subsystem: subsystem, category: "Network")
    static let viewLifeCycle = OSLog(subsystem: subsystem, category: "ViewLifeCycle")
}
