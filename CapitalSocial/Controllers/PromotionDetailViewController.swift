//
//  PromotionDetailViewController.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/24/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

class PromotionDetailViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var testDescription: UITextView!
    
    var promotion: Promotion = Promotion(information: ["":""])

    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = self.promotion.title
        testDescription.text = self.promotion.description
        testImage.sd_setImage(with: self.promotion.imageUrl, placeholderImage: UIImage(named: "placeholder.png"))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(share))
    }

    convenience init(promotion: Promotion) {
        self.init()
        self.promotion = promotion
    }
    
    @objc func share() {
        
        let model = PromotionDetailViewModel.init(promotion: self.promotion)
        guard let activity = model.getSharePromotionActivityView() else {
            return
        }
        
        self.present(activity, animated: true, completion: nil)
        
        if let popOver = activity.popoverPresentationController {
            popOver.sourceView = self.view
            
            let barButtonItem = self.navigationItem.rightBarButtonItem!
            let buttonItemView = barButtonItem.value(forKey: "view") as? UIView
            //var buttonItemSize = buttonItemView?.frame.origin
            //TODO: ADD THE RIGHT LOCATION FOR THE POP UP
            popOver.sourceRect = CGRect(origin: (buttonItemView?.frame.origin)!, size: (buttonItemView?.frame.size)!)
            //popOver.barButtonItem
        }
        
    }
    
    
}

extension PromotionDetailViewController {
    
    // Set up UI elements here using the 'promotion'
    
    // Also use the promotion view model to share the information with the activity ui tool
    
}

