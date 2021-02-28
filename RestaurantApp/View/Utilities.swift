//
//  Utilities.swift
//  RestaurantApp
//
//  Created by Nitin Patil on 28/02/21.
//

import Foundation
import UIKit

class Utilities{
    
    func ContainerView(image:UIImage,tf:UILabel,_ color:UIColor)->UIView{
        
        let cv = UIView()
        cv.heightAnchor.constraint(equalToConstant: 30).isActive = true

        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = color
        cv.addSubview(iv)
        
        iv.anchor(left:cv.leftAnchor,bottom: cv.bottomAnchor,paddingLeft: 5,paddingBottom: 5)
        iv.setDimensions(width: 20, height: 20)
        iv.layer.cornerRadius = 10
        
        cv.addSubview(tf)
        tf.anchor(left:iv.rightAnchor,bottom: cv.bottomAnchor,right:cv.rightAnchor,paddingLeft: 5,paddingBottom: 5,paddingRight: 5)
        
        return cv
    }
    
    func ImageView(image:UIImage,height:CGFloat,_ color:UIColor)->UIImageView{

        let iv = UIImageView()
        iv.image = image
        iv.contentMode = .scaleToFill
        iv.backgroundColor = color
        iv.layer.borderWidth = 2
        iv.layer.borderColor = color.cgColor
        iv.layer.masksToBounds = true
        iv.setDimensions(width: height, height: height)
        return iv
    }
    
    func ContainerView(iv:UIImageView,tf:UILabel)->UIView{
        
        let cv = UIView()
        cv.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cv.addSubview(iv)
        iv.anchor(left:cv.leftAnchor,bottom: cv.bottomAnchor,paddingLeft: 5,paddingBottom: 5)
        iv.centerY(inView: cv)
        
        cv.addSubview(tf)
        tf.centerY(inView: cv)

        tf.anchor(left:iv.rightAnchor,bottom: cv.bottomAnchor,right:cv.rightAnchor,paddingLeft: 5,paddingBottom: 5,paddingRight: 5)
        return cv
    }
}

