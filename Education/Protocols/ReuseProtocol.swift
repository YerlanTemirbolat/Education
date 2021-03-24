//
//  ReusableProtocol.swift

import UIKit
 
protocol ReusableProtocol {
    static var reuseIdentifier: String { get }
}

extension ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

public extension UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    } 
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: Bundle(for: self))
    }
}
extension ReusableProtocol where Self: UITableViewCell {
    
    /// Register Cell Class into TableView with Class name indentifier
    ///
    /// - Parameter table: the table to register
    static func registerClass(into table: UITableView) {
        table.register(self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    /// Register nib cell into TableView with class name identifier
    ///
    /// - Parameter table: the table to register
    static func register(into table: UITableView) {
        table.register(self.nib, forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    /// Load cell with class name identifier as reusable cell
    ///
    /// - Note: *Be sure:* to register cell into TableView
    /// - Parameter table: TableView
    /// - Returns: cell to show
    static func load(for table: UITableView, indexPath: IndexPath) -> Self {
        table.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! Self
    }
    
}

extension ReusableProtocol where Self: UICollectionViewCell {
    
    /// Register nib cell into CollectionView with class name identifier
    ///
    /// - Parameter table: the table to register
    static func registerClass(into collection: UICollectionView) {
        collection.register(self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    /// Register nib cell into CollectionView with class name identifier
    ///
    /// - Parameter collection: CollectionView to register
    static func register(into collection: UICollectionView) {
        collection.register(self.nib, forCellWithReuseIdentifier: self.reuseIdentifier)
    }
    
    /// Load cell with class name identifier as reusable cell
    ///
    /// - Note: *Be sure:* to register cell into CollectionView
    /// - Parameter table: CollectionView
    /// - Returns: cell to show
    static func load(into collection: UICollectionView, for indexPath: IndexPath) -> Self {
        collection.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as! Self
    }
    
}

// MARK: - UICollectionViewReusableView
extension ReusableProtocol where Self: UICollectionReusableView {
    
    /// Register reusable view into CollectionView with class name identifier
    ///
    /// - Parameter collectionView: the table to register
    /// - Parameter kind: element kind **Default** Header
    static func registerClass(into collection: UICollectionView,
                              for kind: String = UICollectionView.elementKindSectionHeader) {
        collection.register(self,
                            forSupplementaryViewOfKind: kind,
                            withReuseIdentifier: self.reuseIdentifier)
    }
    
    /// Register nib reusable view  into CollectionView with class name identifier
    ///
    /// - Parameter collection: CollectionView to register
    /// - Parameter kind: element kind **Default** Header
    static func register(into collection: UICollectionView,
                         for kind: String = UICollectionView.elementKindSectionHeader) {
        collection.register(self.nib,
                            forSupplementaryViewOfKind: kind,
                            withReuseIdentifier: self.reuseIdentifier)
    }
    
    /// Load reusable view  with class name identifier for CollectionViewl
    ///
    /// - Note: *Be sure:* to register view  into CollectionView
    /// - Parameter table: CollectionView
    /// - Parameter kind: element kind **Default** Header
    /// - Returns: Resuable view  to show
    static func load(into collection: UICollectionView,
                     kind: String = UICollectionView.elementKindSectionHeader,
                     for indexPath: IndexPath) -> Self {
        collection.dequeueReusableSupplementaryView(ofKind: kind,
                                                           withReuseIdentifier: self.reuseIdentifier,
                                                           for: indexPath) as! Self
    }
    
}
