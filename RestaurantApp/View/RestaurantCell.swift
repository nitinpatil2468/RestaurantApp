//
//  RestaurantCell.swift
//  RestaurantApp
//
//  Created by Nitin Patil on 28/02/21.
//

import UIKit
import Photos

class RestaurantCell: UICollectionViewCell {

    var data:RestaurantList?{
        didSet{
            manageData()
        }
    }

    let cardImage:UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.layer.cornerRadius = 15.0
        return img
    }()
    
 
    let titleLbl:UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.text = "Titanic"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        label.numberOfLines = 1;
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let RatingLabel:UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.text = "4.0/5.0"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let menuLabel:UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.text = "Amrai,Kalyan"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16.0)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    
    let priceLabel:UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        let rupee = "\u{20B9}"
        label.text = "\(rupee)200 for one"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
    let favButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setDimensions(width: 40, height: 40)
        button.layer.cornerRadius = 20
        button.setImage(#imageLiteral(resourceName: "pin"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.alpha = 0.7
//        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    

    private lazy var ratingView : UIView = {
        let image = #imageLiteral(resourceName: "star")
        let iv = Utilities().ImageView(image: image, height: 20, #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        let view = Utilities().ContainerView(iv: iv, tf: RatingLabel)
        view.backgroundColor = .white
        return view
    }()
    
    private let orderLabel : UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.text = "100+ people order since lockdown"
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    private lazy var orderView : UIView = {
        let image = #imageLiteral(resourceName: "rise")
        let iv = Utilities().ImageView(image: image, height: 30, #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        let view = Utilities().ContainerView(iv: iv, tf: orderLabel)
        iv.layer.cornerRadius = 15
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    let timeLabel:UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.text = "42 mins"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        label.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.layer.cornerRadius = 6
        label.alpha = 0.7
        return label
    }()
    
  
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI(){
        
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 5.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
                
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.borderWidth = 5.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0.0)//CGSizeMake(0, 2.0);
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.6
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 15.0
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath

        addSubview(cardImage)
        addSubview(titleLbl)
        addSubview(menuLabel)
        addSubview(priceLabel)
        addSubview(ratingView)
        addSubview(favButton)
        addSubview(orderView)
        addSubview(timeLabel)



        cardImage.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0,height: self.frame.height / 1.5)
        titleLbl.anchor( top: cardImage.bottomAnchor, left: leftAnchor,paddingTop: 5, paddingLeft: 10, height: 30)
        ratingView.anchor( top: titleLbl.topAnchor, right: rightAnchor,paddingTop: 0, paddingRight: 10, height: 30)
        menuLabel.anchor( top: titleLbl.bottomAnchor, left: leftAnchor,paddingTop: 3, paddingLeft: 10, height: 30)
        priceLabel.anchor( top: menuLabel.topAnchor, right: rightAnchor,paddingTop: 0, paddingRight: 10, height: 30)
        favButton.anchor(top: cardImage.topAnchor,right: cardImage.rightAnchor, paddingTop: 10, paddingRight:10)
        orderView.anchor(top: menuLabel.bottomAnchor, left : leftAnchor,paddingBottom: 5, height : 50)
        timeLabel.anchor(bottom: cardImage.bottomAnchor,right: cardImage.rightAnchor, paddingBottom : 20, paddingRight:10)



    }

    
    func manageData(){
        guard let data = data else {return}
        print("data  : \(data)")
        if let img = Constant.imageArray.randomElement() {
            cardImage.image = UIImage(named: img)
        }
        titleLbl.text = data.restaurant.name
        let prize = data.restaurant.average_cost_for_two / 2
        priceLabel.text = "\("\u{20B9}") \(prize) for one"
        RatingLabel.text = "\(data.restaurant.user_rating.aggregate_rating)/5"
        menuLabel.text = data.restaurant.cuisines
        if let orders = Constant.orders.randomElement() {
            orderLabel.text = "\(orders)+ people ordered from here since lockdown."
        }
        
    }
}
