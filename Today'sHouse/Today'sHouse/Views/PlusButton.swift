//
//  PlusButton.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/01.
//

import Foundation
import UIKit



//extension UITabBarItem {
//
//    public enum SystemItem {
//        
//        case plus
//        
//    }
//        static func setPlusButton(_ name: SystemItem) -> UIButton {
//            let plusButton = PlusButton()
//            switch name {
//            case .plus:
//                return plusButton
//            
//        }
//    }
//}


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
