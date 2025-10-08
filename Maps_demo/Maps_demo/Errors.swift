//
//  Errors.swift
//  Maps_demo
//
//  Created by Ivan_Tests on 30.05.2025.
//

import Foundation

enum DataErrors:Error {
    case itemNotFound
    case rateLimiting
    case systemError(any Error)
}
