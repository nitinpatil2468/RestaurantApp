//
//  RestaurantModel.swift
//  RestaurantApp
//
//  Created by Nitin Patil on 28/02/21.
//


import Foundation

struct ResponseData : Codable{
    let restaurants : [RestaurantList]
}

struct RestaurantList : Codable {
    let restaurant: RestaurantInfo
}

struct RestaurantInfo : Codable {
    let user_rating: UserRating
    let name: String
    let cuisines : String
    let average_cost_for_two : Int
}

struct UserRating : Codable {
    let aggregate_rating: String
}



