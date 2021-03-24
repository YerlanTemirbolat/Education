//
//  UITableView+Utils.swift
//  Education
//
//  Created by Admin on 20.03.2021.
//

import UIKit

extension UITableView {
    static func makeTable() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .lightGray
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: .leastNormalMagnitude))
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }
    
    func updateHeightOfRow(_ cell: UITableViewCell, _ textView: UITextView) {
            let size = textView.bounds.size
            let newSize = sizeThatFits(CGSize(width: size.width,
                                                            height: CGFloat.greatestFiniteMagnitude))
            if size.height != newSize.height {
                UIView.setAnimationsEnabled(false)
                beginUpdates()
                endUpdates()
                UIView.setAnimationsEnabled(true)
                if let thisIndexPath = indexPath(for: cell) {
                    scrollToRow(at: thisIndexPath, at: .bottom, animated: false)
                }
            }
        }
}
