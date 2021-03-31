//
//  LoginView.swift
//  Example
//
//  Created by Sven Tiigi on 05.01.21.
//  Copyright © 2021 Sven Tiigi. All rights reserved.
//

import SwiftUI
import ValidatedPropertyKit

struct LoginView: View {
    @Validated(!.isEmpty && .isEmail)
    var mailAddress = String()

    @Validated(.range(8...))
    var password = String()

    @Validated(!.isEmpty && .range(4...))
    var name: String = ""

    var body: some View {
        List {
            TextField("E-Mail", text: self.$mailAddress)
                .shakeEffect(shakes: _mailAddress.invalidAttempts)
            TextField("Password", text: self.$password)

            TextField("Name", text: self.$name)
                .validation(self._name)

            Button(
                action: {
                    _mailAddress.highlightIfNeeded()
                    _name.highlightIfNeeded()
                },
                label: {
                    Text("Submit")
                }
            )
            .validated(self._password)
        }
        .listStyle(InsetGroupedListStyle())
    }
    
}
