//
//  ReusableIdentifierProtocol.swift
//  BoxOffice
//
//  Created by 조규연 on 6/5/24.
//

import UIKit

protocol ReusableIdentifierProtocol {
    static var identifier: String { get }
}

extension UIViewController: ReusableIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableIdentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
    
    
}
