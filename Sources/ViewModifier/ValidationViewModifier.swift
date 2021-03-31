//
//  ValidationModifier.swift
//  ValidatedPropertyKit-iOS
//
//  Created by Mohammad Alatrash on 30/03/2021.
//  Copyright © 2021 Sven Tiigi. All rights reserved.
//

import SwiftUI

struct ValidationViewModifier<Value>: AnimatableModifier {
    private let prop: Validated<Value>

    init(prop: Validated<Value>) {
        self.prop = prop
    }

    func body(content: Content) -> some View {
        content
            .shakeEffect(shakes: prop.invalidAttempts)
            .animation(prop.isValid ? .none : .linear)
    }
}

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

