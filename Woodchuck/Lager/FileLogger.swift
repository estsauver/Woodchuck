//
//  FileLogger.swift
//  Logger
//
//  Created by Earl J St Sauver on 11/17/14.
//
//

import Foundation

public class FileLogger:BaseLogger {
    
    var file:String? = nil
    
    class func fileLogHandler(file: String)-> (String)->() {
        return {
            (content:String) -> () in
            let data = content.dataUsingEncoding(NSUTF8StringEncoding,
                allowLossyConversion: true)
            data?.writeToFile(file, atomically: true)
        }
    }
    
    init(file: String = FileLogger.generateLogFile()) {
        super.init(logHandler: FileLogger.fileLogHandler(file))
        var file = file
    }
    
    public class func generateLogFile() -> String {
        let randomPiece = "\(NSProcessInfo.processInfo().globallyUniqueString).log"
        let dir = NSTemporaryDirectory().stringByAppendingPathComponent(randomPiece)
        return dir
    }
}
