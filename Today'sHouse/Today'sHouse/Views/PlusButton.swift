//
//  PlusButton.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/01.
//

import Foundation
import UIKit



extension UITabBarItem {
    
    
    
    enum MyItem {
        case plus
        case minus
        
        func setPlusButton() -> UIImage {
            switch self {
            case .plus:
                return UIImage(named: "PlusButton")!
            case .minus:
                return UIImage(named: "minus")!
            }
        }
    }
    
    
    class PlusButton: UIButton {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            self.clipsToBounds = true
            self.layer.cornerRadius = 5
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
            self.layer.shadowRadius = 5
            self.layer.shadowOpacity = 0.3
            self.backgroundColor = .blue
        }
        
        init(view: UIView) {
            super.init(frame: .zero)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
