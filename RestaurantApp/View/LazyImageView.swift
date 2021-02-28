//
//  LazyImageView.swift
//  RestaurantApp
//
//  Created by Nitin Patil on 28/02/21.
//

import Foundation
import UIKit
import Kingfisher

class LazyImageView : UIImageView{
    
    let imageCache = NSCache<AnyObject,UIImage>()
    func loadImage(imageUrl : URL){
        
        self.image = UIImage(named: "loader.png")
        
//        let str = "https://b.zmtcdn.com/data/res_imagery/16788789_RESTAURANT_379f9b1fa98e9d4c04634649654d479c_c.png"
//        let url : URL = URL(string: str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        
        self.kf.indicatorType = .activity
        let imgResource = ImageResource(downloadURL: imageUrl, cacheKey: imageUrl.absoluteString)
        self.kf.setImage(with: imgResource, placeholder: nil, options: [.transition(.fade(0.7))], completionHandler: nil)
        
//        if let cacheImage = self.imageCache.object(forKey: imageUrl as AnyObject){
//            self.image = cacheImage
//            return
//        }
//
//        DispatchQueue.global().async{
//            [weak self] in
//            if let imgData = try? Data(contentsOf: imageUrl){
//                if let img = UIImage(data: imgData){
//                    DispatchQueue.main.async {
//                        self?.imageCache.setObject(img, forKey: imageUrl as AnyObject)
//                        self?.image = img
//                    }
//                }
//            }
//        }
    }
}

