//
//  RukkusPerformers.swift
//
//  Created by abdelrahman mohamed on 10/3/17
//  Copyright (c) yoloabdo. All rights reserved.
//

import Foundation
import Marshal


public struct RukkusPerformers: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let headshotUrl = "headshot_url"
    static let id = "id"
    static let urlStub = "url_stub"
    static let bannerUrl = "banner_url"
  }

  // MARK: Properties
  public var name: String?
  public var headshotUrl: String?
  public var id: Int?
  public var urlStub: String?
  public var bannerUrl: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    name = try? object.value(for: SerializationKeys.name)
    headshotUrl = try? object.value(for: SerializationKeys.headshotUrl)
    id = try? object.value(for: SerializationKeys.id)
    urlStub = try? object.value(for: SerializationKeys.urlStub)
    bannerUrl = try? object.value(for: SerializationKeys.bannerUrl)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = headshotUrl { dictionary[SerializationKeys.headshotUrl] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = urlStub { dictionary[SerializationKeys.urlStub] = value }
    if let value = bannerUrl { dictionary[SerializationKeys.bannerUrl] = value }
    return dictionary
  }

}
