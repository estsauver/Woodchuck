//
//  AbstractLogger.swift
//  Lager
//
//  Created by Earl J St Sauver on 11/17/14.
//
//

import Foundation

public protocol Logger {
    func log(message: String, logLevel: LogLevel, functionName: String)
    func trace(message: String, functionName: String)
    func debug(message: String, functionName: String)
    func info(message: String, functionName: String)
    func warn(message: String, functionName: String)
    func error(message: String, functionName: String)
    func fatal(message: String, functionName: String)
}

