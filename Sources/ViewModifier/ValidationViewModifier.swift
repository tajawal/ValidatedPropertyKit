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
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(prop.invalidAttempts == 0 ? .clear : .red)
            )
            .shakeEffect(shakes: prop.invalidAttempts)
    }
}

struct ShakeEffect: GeometryEffect {
    var travelDisatance: CGFloat = 6
    var numberOfShakes: CGFloat = 4
    var animatableData: CGFloat

    init(shakes: Int) {
        animatableData = CGFloat(shakes)
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let translationX = travelDisatance * sin(animatableData * .pi * numberOfShakes)
        return ProjectionTransform(CGAffineTransform(translationX: translationX, y: 0))
    }
}
