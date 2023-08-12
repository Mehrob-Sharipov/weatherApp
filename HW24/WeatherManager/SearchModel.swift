//
//  SearchModel.swift
//  HW24
//
//  Created by Sharipov Mehrob on 30.07.2023.
//

import Foundation
 
//struct SearchModel: Codable {
//    let id: Int
//    let name, region, country: String
//    let lat, lon: Double
//    let url: String
//}
 
 
 
//MARK: - Element
struct SearchModel: Codable {
//   let placeID, osmID, osmType: String?
//   let licence: String?
//   let lat, lon: String?
//   let boundingbox: [String]?
//   let purpleClass, type, displayName, displayPlace: String?
//   let displayAddress: String?
   let address: Address?

   enum CodingKeys: String, CodingKey {
//       case placeID = "place_id"
//       case osmID = "osm_id"
//       case osmType = "osm_type"
//       case licence, lat, lon, boundingbox
//       case purpleClass = "class"
//       case type
//       case displayName = "display_name"
//       case displayPlace = "display_place"
//       case displayAddress = "display_address"
       case address
   }
}

// MARK: - Address
struct Address: Codable {
   let name, postcode, country, countryCode: String?
   let city, road, suburb: String?

   enum CodingKeys: String, CodingKey {
       case name, postcode, country
       case countryCode = "country_code"
       case city, road, suburb
   }
}
