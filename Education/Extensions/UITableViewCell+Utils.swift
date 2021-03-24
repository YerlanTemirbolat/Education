//
//  UITableViewCell+Utils.swift

import UIKit

extension UITableViewCell: ReusableProtocol {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
