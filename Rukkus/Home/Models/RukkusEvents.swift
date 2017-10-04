//
//  RukkusEvents.swift
//
//  Created by abdelrahman mohamed on 10/3/17
//  Copyright (c) yoloabdo. All rights reserved.
//

import Foundation
import Marshal

public struct RukkusEvents: Unmarshaling {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let next = "next"
        static let results = "results"
        static let count = "count"
    }
    
    // MARK: Properties
    public var next: String?
    public var results: [RukkusResults]?
    public var count: Int?
    
    // MARK: Marshal Initializers
    
    /// Map a JSON object to this class using Marshal.
    ///
    /// - parameter object: A mapping from ObjectMapper
    public init(object: MarshaledObject) {
        next = try? object.value(for: SerializationKeys.next)
        results = try? object.value(for: SerializationKeys.results)
        count = try? object.value(for: SerializationKeys.count)
    }
    init?(_ value: Any?) {
        guard let object = value as? MarshaledObject else {
            return nil
        }
        self.init(object: object)
    }
    init() {}
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = next { dictionary[SerializationKeys.next] = value }
        if let value = results { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
        if let value = count { dictionary[SerializationKeys.count] = value }
        return dictionary
    }
    
}

