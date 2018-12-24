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
    }

    convenience init(promotion: Promotion) {
        self.init()
        self.promotion = promotion
    }
    
    @IBAction func share(_ sender: Any) {
        
        let model = PromotionDetailViewModel.init(promotion: self.promotion)
        guard let activity = model.getSharePromotionActivityView() else {
            return
        }
        
        self.present(activity, animated: true, completion: nil)
        
        if let popOver = activity.popoverPresentationController {
            popOver.sourceView = self.view
            //TODO: ADD THE RIGHT LOCATION FOR THE POP UP
            //popOver.sourceRect =
            //popOver.barButtonItem
        }
        
    }
    
    
}

extension PromotionDetailViewController {
    
    // Set up UI elements here using the 'promotion'
    
    // Also use the promotion view model to share the information with the activity ui tool
    
}

