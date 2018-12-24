//
//  PromotionsViewController.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/24/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftKeychainWrapper

class PromotionsViewController: UIViewController {
    
    var promotions: [Promotion]?
   
    @IBOutlet weak var theCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPromotions()
        
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Colors.pinkColorCdmx

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
    
    /// Validates if a user is logged in or not and defines the flow of the App
    override func viewWillAppear(_ animated: Bool) {
        if RouterViewModel.getUserStatus() == .authenticated {
            setUpPromotions()
        } else {
            goToLogInFlow()
        }
    }
    
    @IBAction func openMap(_ sender: Any) {
        goToMap()
    }
    
    @IBAction func logOut(_ sender: Any) {
        let _ = KeychainWrapper.standard.removeObject(forKey: "CapitalSocialUserToken")
        goToLogInFlow()
    }
}

/// Extension to handle the Flow of the App
internal extension PromotionsViewController {
    // Initializes the elements in the collection view with all the Promotions
    func setUpPromotions() {
        let model = PromotionsViewModel.init()
        promotions = model.getPromotions()
        configureCollectionView()
    }
    
    //present 'LoginViewController'  (as stack)
    func goToLogInFlow() {
        let logInViewController = LoginViewController()
        present(logInViewController, animated: true, completion: nil)
    }
    
}

/// Extension to hanlde the Flow inside the Promotions View Controller
extension PromotionsViewController: DisplayPromotionsProtocol {
    
    func goToMap() {
        let mapVC = MapViewController()
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    func goToDetailFor(_ promotion: Promotion) {
        let detailVC = PromotionDetailViewController.init(promotion: promotion)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension PromotionsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func configureCollectionView() {
        theCollectionView.register(UINib(nibName: "PromotionCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "CapitalCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (promotions?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = theCollectionView.dequeueReusableCell(withReuseIdentifier: "CapitalCell", for: indexPath) as! PromotionCollectionViewCell
        
        let currentPromotion = promotions?[indexPath.item]
        cell.title.text = currentPromotion?.title
        cell.image.sd_setImage(with: currentPromotion?.imageUrl, placeholderImage: UIImage(named: "placeholder.png"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let currentPromotion = promotions?[indexPath.item] else {
            return
        }
    
        let detailVC = PromotionDetailViewController.init(promotion: currentPromotion)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

