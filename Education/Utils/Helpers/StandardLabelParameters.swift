//
//  StandardLabelParameters.swift
//  Education
//
//  Created by Admin on 20.03.2021.
//

import UIKit

enum StandardLabelParameters {
   
   var text: String {
       switch self {
       case let .attributed(attributedText):
           return attributedText.string
       case let .normal(text, _, _ ,_ ,_):
          return text ?? ""
       case let .onlyText(text):
           return text ?? ""
       }
   }
   
   case attributed(_: NSAttributedString)
   case normal(text: String?, color: UIColor, font: UIFont, alignment: NSTextAlignment, numberOfLines: Int)
   case onlyText(text: String?)
   
    static func with(text: String? = nil,
                    color: UIColor = .black,
                    font: UIFont = UIFont.systemFont(ofSize: FontConstants.normal),
                    alignment: NSTextAlignment = .left,
                    numberOfLines: Int = 1) -> StandardLabelParameters {
       return .normal(text: text, color: color, font: font, alignment: alignment, numberOfLines: numberOfLines)
   }

    func apply(to label: UILabel) {
       switch self {
       case let .attributed(attributedText):
           label.text = nil
           label.attributedText = attributedText
       case let .normal(text, color, font, alignment, numberOfLines):
           label.attributedText = nil
           label.text = text
           label.textColor = color
           label.textAlignment = alignment
           label.numberOfLines = numberOfLines
           label.font = font
       case let .onlyText(text):
           label.text = text
       }
   }

    func apply(to textView: UITextView) {
       switch self {
       case let .attributed(attributedText):
           textView.attributedText = attributedText
        case let .normal(text, color, font, alignment, _):
           textView.text = text
           textView.textColor = color
           textView.textAlignment = alignment
           textView.font = font
       case let .onlyText(text):
           textView.text = text
       }
   }

    func apply(to textField: UITextField) {
       switch self {
       case let .attributed(attributedText):
           textField.attributedText = attributedText
       case let .normal(text, color, font, alignment, _):
           textField.text = text
           textField.textColor = color
           textField.textAlignment = alignment
           textField.font = font
       case let .onlyText(text):
           textField.text = text
       }
   }
}
