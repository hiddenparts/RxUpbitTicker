//
//  UITableViewCell+identifier.swift
//  rxUpbitTicker
//
//  Created by 상선 on 2021/03/05.
//

import UIKit

extension UITableViewCell {
    class var identifier: String {
        get {
            return String(describing: self)
        }
    }
}
