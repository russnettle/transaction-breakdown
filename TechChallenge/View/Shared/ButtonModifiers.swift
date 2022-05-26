//
//  ButtonModifiers.swift
//  TechChallenge
//
//  Created by Russell Freeman on 26/05/2022.
//

import SwiftUI

extension Button {
    func category(color: Color) -> some View {
        self
            .padding(8)
            .background(color)
            .cornerRadius(15.0)
    }
}
