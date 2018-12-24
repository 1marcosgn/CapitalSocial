//
//  PromotionDetailViewModel.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/23/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit

public class PromotionDetailViewModel {
    
    let promotion: Promotion
    
    init(promotion: Promotion) {
        self.promotion = promotion
    }
    
    ///TODO: USE this to display the acitvity share present(vc, animated: true)
    func getSharePromotionActivityView() -> UIActivityViewController? {
        var elementsToShare = [Any]()
        elementsToShare.append(promotion.title)
        elementsToShare.append(promotion.description)
        
        if let url = promotion.imageUrl {
            let image = UIImageView.init()
            image.downloaded(from: url)
            elementsToShare.append(image)
        }
        return UIActivityViewController(activityItems: elementsToShare, applicationActivities: [])
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

