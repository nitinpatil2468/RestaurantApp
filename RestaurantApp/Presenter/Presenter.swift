//
//  Presenter.swift
//  RestaurantApp
//
//  Created by Nitin Patil on 28/02/21.
//
import Foundation



protocol UserView: NSObjectProtocol {
    func setRestaurants(_ restaurants: [RestaurantList])
    func setEmptyTable()
}

class Presenter{
    
    fileprivate let service:RestaurantService
    weak fileprivate var userView : UserView?
    
    init(userService:RestaurantService){
        self.service = userService
    }
    
    func attachView(_ view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getUsers(){
        
        service.getRestaurants{ [weak self] restaurants in
            if(restaurants.count == 0){
                self?.userView?.setEmptyTable()
            }else{
                
                self?.userView?.setRestaurants(restaurants)
            }
            
        }
    }
}
