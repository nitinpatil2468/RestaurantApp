//
//  RestaurantService.swift
//  RestaurantApp
//
//  Created by Nitin Patil on 28/02/21.
//


import Foundation

class RestaurantService {
    
    //the service delivers mocked data with a delay
    func getRestaurants(_ callBack:@escaping ([RestaurantList]) -> Void){
        let APIRequest = "\(Constant.PATH)"
        let url : URL = URL(string: APIRequest.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        
        NetworkRequestHandler.shared.GET(url:url, completion: {(responseString , error) in
            if let xmlString = responseString{
                do {
                    let jsonData = xmlString.data(using: .utf8)
                    
                    if let userInfo = try JSONDecoder().decode(ResponseData.self, from: jsonData!) as? ResponseData{
                        let restaurants = userInfo.restaurants
                        callBack(restaurants)
                    }
             
                } catch {
                    
                    print(error.localizedDescription)
                    
                }
            }else if let error = error{
                print (error.localizedDescription as Any);
            }
        })
    }
}

