//
//  GlobalFunctions.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 27.05.2025.
//

import OSLog

func createLogger(subsystem:String, category:String) -> Logger {
    #if DEBUG
    return Logger(subsystem: subsystem, category: category)
    #else
    return Logger(.disabled)
    #endif
}
