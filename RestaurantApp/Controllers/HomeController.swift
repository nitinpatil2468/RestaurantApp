//
//  HomeController.swift
//  RestaurantApp
//
//  Created by Nitin Patil on 28/02/21.
//

import UIKit


class HomeController: UIViewController {
    
    let presenter = Presenter(userService: RestaurantService())
    var DataList = [RestaurantList]()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        cv.register(RestaurantCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cv
    }()
    
    let TitleLabel:UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.text = "Restaurants"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 24.0)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    
    let Alert:UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.text = "Data is not available"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25.0)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return label
    }()
    
    lazy var searchController:UISearchController = {
        let sb = UISearchController(searchResultsController: nil)
        sb.dimsBackgroundDuringPresentation = false // Optional
        sb.searchBar.delegate = self
        sb.hidesNavigationBarDuringPresentation = false
        return sb
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureUI()
        presenter.attachView(self)
        presenter.getUsers()
    }
    
    
    
    
    func configureUI(){
        
        navigationItem.searchController = searchController
        self.navigationItem.title = "Restaurants"
        
        self.view.addSubview(collectionView)
        self.view.addSubview(Alert)
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 15)
        Alert.anchor(left: view.leftAnchor,right: view.rightAnchor, paddingLeft: 5, paddingRight: 5); Alert.centerX(inView: self.view)
        
        Alert.centerY(inView: self.view)
        
        Alert.isHidden = false
    }
    
    
}

extension HomeController : UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return DataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RestaurantCell
        cell.data = DataList[indexPath.row]
        return cell
     }
    
    func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.model.hasPrefix("iPad") {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 2 - 20 )
        } else {
            return CGSize(width: collectionView.bounds.width, height: UIScreen.main.bounds.size.height / 2 - 20 )
        }

    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Selected Dish")

    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }


}


extension HomeController: UserView {

    func setRestaurants(_ users: [RestaurantList]) {
        DataList = users
        collectionView.isHidden = false
        Alert.isHidden = true;
        collectionView.reloadData()
    }

    func setEmptyTable() {
        collectionView.isHidden = true
        Alert.isHidden = false;
    }


}

extension HomeController : UISearchBarDelegate {
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
       
    }
}

  
    



