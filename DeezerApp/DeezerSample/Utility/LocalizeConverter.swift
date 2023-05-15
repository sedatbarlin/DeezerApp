//
//  LocalizeConverter.swift
//  DeezerSample
//
//  Created by Sedat on 9.05.2023.
//

import Foundation

extension String {
    var localized: String { return NSLocalizedString(self, comment: self) }
}
