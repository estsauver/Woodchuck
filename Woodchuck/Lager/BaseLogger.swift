//
//  BaseLogger.swift
//  Logger
//
//  Created by Earl J St Sauver on 11/17/14.
//
//

import Foundation

public class BaseLogger:Logger {
    
    private var logHandler:String -> ()
    
    public init(logHandler:String -> () = println) {
        self.logHandler = logHandler
    }
    
    public func log(message: String, logLevel: LogLevel, functionName: String = __FUNCTION__) {
        var contents = [
            "logLevel = \(logLevel.rawValue)",
            "fnName = \(functionName)",
            "msg = \(message)"
        ]
        
        self.log(contents)
    }
    
    private func log(contents: [String]) {
        func pipeJoin(items:[String]) -> String {
            precondition(items.count > 1, "In all cases there shouldn't be less than 2 elements, a level and a message")
            return items[1 ..< items.count].reduce(items.first!, {(acc, i) in
                acc + "|" + i
            })
        }
        log(pipeJoin(contents))
    }
    
    private func log(contents: String) {
        logHandler(contents)
    }
    
    public func trace(message: String, functionName: String = __FUNCTION__) {
        log(message, logLevel: LogLevel.TRACE, functionName: functionName)
    }
    
    public func debug(message: String, functionName: String = __FUNCTION__) {
        log(message, logLevel: LogLevel.DEBUG, functionName: functionName)
    }
    
    public func info(message: String, functionName: String = __FUNCTION__) {
        log(message, logLevel: LogLevel.DEBUG, functionName: functionName)
    }
    
    public func warn(message: String, functionName: String = __FUNCTION__) {
        log(message, logLevel: LogLevel.DEBUG, functionName: functionName)
    }
    
    public func error(message: String, functionName: String = __FUNCTION__) {
        log(message, logLevel: LogLevel.DEBUG, functionName: functionName)
    }
    
    public func  fatal(message: String, functionName: String = __FUNCTION__) {
        log(message, logLevel: LogLevel.DEBUG, functionName: functionName)
    }
}