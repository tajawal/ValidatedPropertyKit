//
//  View+validated.swift
//  ValidatedPropertyKit
//
//  Created by Sven Tiigi on 04.01.21.
//  Copyright © 2021 Sven Tiigi. All rights reserved.
//

import SwiftUI

// MARK: - View+validated

public extension View {
    
    /// Adds a condition that controls whether users can interact
    /// with this view if all given `Validatable` instances are valid
    /// - Parameter validatables: The Validatables
    func validated(
        _ validatables: Validatable...
    ) -> some View {
        self.disabled(
            validatables
                .map(\.isValid)
                .contains(false)
        )
    }

    /// Adds a shake animation when manually apply validations
    /// - Parameter prop: projected value of `Validated`
    func validation<Value>(_ prop: Validated<Value>) -> some View {
        modifier(ValidationViewModifier(prop: prop))
    }

    /// Adds shake animation to a view
    /// - Parameter shakes: number of shakes
    func shakeEffect(shakes: Int) -> some View {
        modifier(ShakeEffect(shakes: shakes))
            .animation(.linear)
    }
}
