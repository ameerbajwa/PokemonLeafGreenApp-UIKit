//
//  PaddedTextField.swift
//  PokemonLeafGreenApp-UIKit
//
//  Created by Ameer Bajwa on 7/21/25.
//

import Foundation
import UIKit

class PaddedTextField: UITextField {
    let padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
