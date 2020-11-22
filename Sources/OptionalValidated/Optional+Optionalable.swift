//
//  Optional+Optionalable.swift
//  ValidatedPropertyKit
//
//  Created by Sven Tiigi on 22.11.20.
//  Copyright © 2020 Sven Tiigi. All rights reserved.
//

import Foundation

// MARK: - Optional+Optionalable

extension Optional: Optionalable {
    
    /// The wrapped value
    public var wrapped: Wrapped? {
        // Switch on self
        switch self {
        case .some(let wrapped):
            // Return wrapped value
            return wrapped
        case .none:
            // Return nil
            return nil
        }
    }
    
}
