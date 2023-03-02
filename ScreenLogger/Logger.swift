//
//  Logger.swift
//  ScreenLogger
//
//  Created by Eren Erten on 4.02.2023.
//

import Foundation

protocol textSetterDelegate{
    func reloadTable()
}

public func print(_ string: String) {
    let logObject = LogModel()
    logObject.logString = string
    logObject.logTime = Date()
    Logger.logArray.append(logObject)
}
class Logger{
    static var delegate: textSetterDelegate?
    
    static var logArray = [LogModel]() {
        didSet {
            delegate?.reloadTable()
        }
    }
}


