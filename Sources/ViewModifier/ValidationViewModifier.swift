//
//  ValidationModifier.swift
//  ValidatedPropertyKit-iOS
//
//  Created by Mohammad Alatrash on 30/03/2021.
//  Copyright © 2021 Sven Tiigi. All rights reserved.
//

import SwiftUI

public struct ValidationViewModifier: AnimatableModifier {
    @State var attempts: Int = 0
    @State var isValid: Bool = false

    public init(attempts: Int, isValid: Bool) {
        self.attempts = attempts
        self.isValid = isValid
    }

    public func body(content: Content) -> some View {
        content
            .shakeEffect(shakes: attempts)
            .animation(isValid ? .none : .linear)
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
