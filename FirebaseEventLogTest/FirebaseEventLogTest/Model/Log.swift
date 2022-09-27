//
//  Log.swift
//  FirebaseEventLogTest
//
//  Created by 이진욱 on 2022/09/27.
//

import Foundation
import os.log

struct Log {
    
    enum Level {
        
        case info
        case debug
        case error
        case network
        case viewLifeCycle

        fileprivate var category: String {
            switch self {
            case .info:
                return "Info"
            case .debug:
                return "Debug"
            case .error:
                return "Error"
            case .network:
                return "Network"
            case .viewLifeCycle:
                return "ViewLifeCycle"
            }
        }

        fileprivate var osLog: OSLog {
            switch self {
            case .info:
                return OSLog.info
            case .debug:
                return OSLog.debug
            case .error:
                return OSLog.error
            case .network:
                return OSLog.network
            case .viewLifeCycle:
                return OSLog.debug
            }
        }

        fileprivate var osLogType: OSLogType {
            switch self {
            case .info:
                return .info
            case .debug:
                return .debug
            case .error:
                return .error
            case .network:
                return .default
            case .viewLifeCycle:
                return .debug
            }
        }
    }

    static private func log(level: Level, message: Any) {
        #if DEBUG
        if #available(iOS 14.0, *) {
            let logger = Logger(subsystem: OSLog.subsystem, category: level.category)
            let logMessage = "\(message)"
            switch level {
            case .info:
                logger.info("🔈 | \(logMessage, privacy: .public)")
            case .debug:
                logger.error("⚙️ | \(logMessage, privacy: .public)")
            case .error:
                logger.error("⚠️ | \(logMessage, privacy: .public)")
            case .network:
                logger.log("🚀 | \(logMessage, privacy: .public)")
            case .viewLifeCycle:
                logger.log("🌀 | \(logMessage, privacy: .public)")
            }
        } else {
            os_log("%{public}@", log: level.osLog, type: level.osLogType, "\(message)")
        }
        #endif
    }
}

// MARK: - utils

extension Log {

    static func info(message: Any) {
        log(level: .info, message: message)
    }
    
    static func debug(message: Any) {
        log(level: .debug, message: message)
    }
    
    static func error(message: Any) {
        log(level: .error, message: message)
    }

    static func network(message: Any) {
        log(level: .network, message: message)
    }
    
    static func viewLifeCycle(message: Any) {
        log(level: .viewLifeCycle, message: message)
    }
}
