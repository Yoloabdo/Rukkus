//
//  RukkusHeadshot.swift
//
//  Created by abdelrahman mohamed on 10/3/17
//  Copyright (c) yoloabdo. All rights reserved.
//

import Foundation
import Marshal

public struct RukkusHeadshot: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let normal = "normal"
    static let mobileRetina = "mobile-retina"
    static let large = "large"
  }

  // MARK: Properties
  public var normal: String?
  public var mobileRetina: String?
  public var large: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    normal = try? object.value(for: SerializationKeys.normal)
    mobileRetina = try? object.value(for: SerializationKeys.mobileRetina)
    large = try? object.value(for: SerializationKeys.large)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = normal { dictionary[SerializationKeys.normal] = value }
    if let value = mobileRetina { dictionary[SerializationKeys.mobileRetina] = value }
    if let value = large { dictionary[SerializationKeys.large] = value }
    return dictionary
  }

}
