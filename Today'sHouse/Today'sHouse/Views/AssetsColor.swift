//
//  AssetsColor.swift
//  Today'sHouse
//
//  Created by 신민희 on 2021/06/01.
//

import UIKit

enum AssetsColor {
    case mainColor
    case lightGray
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor {
        switch name {
        case .mainColor:
            return #colorLiteral(red: 0.3350401819, green: 0.7853649259, blue: 0.8392842412, alpha: 1)
        case .lightGray:
            return #colorLiteral(red: 0.9439054132, green: 0.9382939935, blue: 0.9482186437, alpha: 1)
        }
    }
}


