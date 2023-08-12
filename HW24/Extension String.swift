//
//  Extension String.swift
//  HW24
//
//  Created by Sharipov Mehrob on 03.08.2023.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
