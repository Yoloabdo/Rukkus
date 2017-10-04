//
//  RukkusVenue.swift
//
//  Created by abdelrahman mohamed on 10/3/17
//  Copyright (c) yoloabdo. All rights reserved.
//

import Foundation
import Marshal


public struct RukkusVenue: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let latitude = "latitude"
    static let city = "city"
    static let name = "name"
    static let state = "state"
    static let urlStub = "url_stub"
    static let distance = "distance"
    static let longitude = "longitude"
    static let getAbsoluteUrl = "get_absolute_url"
  }

  // MARK: Properties
  public var latitude: Float?
  public var city: String?
  public var name: String?
  public var state: String?
  public var urlStub: String?
  public var distance: Int?
  public var longitude: Float?
  public var getAbsoluteUrl: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    latitude = try? object.value(for: SerializationKeys.latitude)
    city = try? object.value(for: SerializationKeys.city)
    name = try? object.value(for: SerializationKeys.name)
    state = try? object.value(for: SerializationKeys.state)
    urlStub = try? object.value(for: SerializationKeys.urlStub)
    distance = try? object.value(for: SerializationKeys.distance)
    longitude = try? object.value(for: SerializationKeys.longitude)
    getAbsoluteUrl = try? object.value(for: SerializationKeys.getAbsoluteUrl)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = latitude { dictionary[SerializationKeys.latitude] = value }
    if let value = city { dictionary[SerializationKeys.city] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = state { dictionary[SerializationKeys.state] = value }
    if let value = urlStub { dictionary[SerializationKeys.urlStub] = value }
    if let value = distance { dictionary[SerializationKeys.distance] = value }
    if let value = longitude { dictionary[SerializationKeys.longitude] = value }
    if let value = getAbsoluteUrl { dictionary[SerializationKeys.getAbsoluteUrl] = value }
    return dictionary
  }

}
