//
//  Licalizable.swift
//  Education
//
//  Created by Admin on 20.03.2021.
//

import Foundation

public protocol Localizable {
    
    var tableName: String { get }
    /// Use for generate dictionary key `prefix.rawValue`
    var prefix: String? { get }
    var localized: String { get }
    func localized(_ param: CVarArg...) -> String
    
}

public extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    
    var prefix: String? {
        nil
    }
    
    var tableName: String {
        "Localizable"
    }
    
    var key: String {
        let keyName = String(reflecting: self).split(separator: ".").last ?? ""
        if String(keyName) == rawValue {
            return prefix == nil ? rawValue : "\(prefix!).\(rawValue)"
        } else {
            return rawValue
        }
    }
    
    func localized(_ param: CVarArg...) -> String {
        let format = self.localized
        return String(format: format, arguments: param)
    }
    
    var localized: String {
        let bundle = BundleToken.bundle

        let result = bundle.localizedString(forKey: key,
                                                 value: "**\(key)**",
                                                 table: tableName)
        return result != "**\(key)**" ? result : defaultLocalized
    }
    
    private var defaultLocalized: String {
        let bundle = BundleToken.bundle
        return bundle.localizedString(forKey: key,
                                           value: "**\(key)**",
                                           table: tableName)
    }
    
}

final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
