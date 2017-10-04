//
//  RukkusResults.swift
//
//  Created by abdelrahman mohamed on 10/3/17
//  Copyright (c) yoloabdo. All rights reserved.
//

import Foundation
import Marshal


public struct RukkusResults: Unmarshaling {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let performers = "performers"
    static let eventTimeLocal = "event_time_local"
    static let timeHuman = "time_human"
    static let androidDeepLinkUrl = "android_deep_link_url"
    static let venue = "venue"
    static let category = "category"
    static let nameAbbrev = "name_abbrev"
    static let ticketCount = "ticket_count"
    static let id = "id"
    static let slug = "slug"
    static let dateHuman = "date_human"
    static let headshot = "headshot"
    static let url = "url"
  }

  // MARK: Properties
  public var name: String?
  public var performers: [RukkusPerformers]?
  public var eventTimeLocal: String?
  public var timeHuman: String?
  public var androidDeepLinkUrl: String?
  public var venue: RukkusVenue?
  public var category: String?
  public var nameAbbrev: String?
  public var ticketCount: Int?
  public var id: Int?
  public var slug: String?
  public var dateHuman: String?
  public var headshot: RukkusHeadshot?
  public var url: String?

  // MARK: Marshal Initializers

  /// Map a JSON object to this class using Marshal.
  ///
  /// - parameter object: A mapping from ObjectMapper
  public init(object: MarshaledObject) {
    name = try? object.value(for: SerializationKeys.name)
    performers = try? object.value(for: SerializationKeys.performers)
    eventTimeLocal = try? object.value(for: SerializationKeys.eventTimeLocal)
    timeHuman = try? object.value(for: SerializationKeys.timeHuman)
    androidDeepLinkUrl = try? object.value(for: SerializationKeys.androidDeepLinkUrl)
    venue = try? object.value(for: SerializationKeys.venue)
    category = try? object.value(for: SerializationKeys.category)
    nameAbbrev = try? object.value(for: SerializationKeys.nameAbbrev)
    ticketCount = try? object.value(for: SerializationKeys.ticketCount)
    id = try? object.value(for: SerializationKeys.id)
    slug = try? object.value(for: SerializationKeys.slug)
    dateHuman = try? object.value(for: SerializationKeys.dateHuman)
    headshot = try? object.value(for: SerializationKeys.headshot)
    url = try? object.value(for: SerializationKeys.url)
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = performers { dictionary[SerializationKeys.performers] = value.map { $0.dictionaryRepresentation() } }
    if let value = eventTimeLocal { dictionary[SerializationKeys.eventTimeLocal] = value }
    if let value = timeHuman { dictionary[SerializationKeys.timeHuman] = value }
    if let value = androidDeepLinkUrl { dictionary[SerializationKeys.androidDeepLinkUrl] = value }
    if let value = venue { dictionary[SerializationKeys.venue] = value.dictionaryRepresentation() }
    if let value = category { dictionary[SerializationKeys.category] = value }
    if let value = nameAbbrev { dictionary[SerializationKeys.nameAbbrev] = value }
    if let value = ticketCount { dictionary[SerializationKeys.ticketCount] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    if let value = dateHuman { dictionary[SerializationKeys.dateHuman] = value }
    if let value = headshot { dictionary[SerializationKeys.headshot] = value.dictionaryRepresentation() }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

}
