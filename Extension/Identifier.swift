//
//  Identifier.swift
//  ToDoList
//
//  Created by 陈振 on 2019/7/11.
//  Copyright © 2019 陈振. All rights reserved.
//

import Foundation

struct Identifier<T>: Hashable, Codable {
    static func ==(lhs: Identifier<T>, rhs: Identifier<T>) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    let rawValue: String
    var hashValue: Int { return rawValue.hashValue }
    
    init(_ rawValue: String = UUID().uuidString) { self.rawValue = rawValue }
    init(rawValue: String) { self.rawValue = rawValue }
}

protocol Identifiable: Hashable {
    var identifier: Identifier<Self> { get }
}

extension Identifiable {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var hashValue: Int { return identifier.hashValue }
}
