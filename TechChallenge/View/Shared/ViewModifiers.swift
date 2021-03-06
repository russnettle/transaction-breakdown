//
//  ViewModifiers.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

extension Text {
    func primary() -> some View {
        self
            .bold()
            .font(.body)
            .foregroundColor(.accentColor)
    }
    
    func secondary(weight: Font.Weight = .regular) -> some View {
        self
            .fontWeight(weight)
            .font(.body)
            .foregroundColor(.accentColor)
    }
    
    func tertiary() -> some View {
        self
            .font(.caption)
            .foregroundColor(.accentColor)
            .opacity(0.8)
    }
    
    func percentage() -> some View {
        self
            .font(.title2)
            .bold()
            .foregroundColor(Color(UIColor.label))
    }
    
    func category() -> some View {
        self
            .font(.title2)
            .fontWeight(.bold)
            .padding(.horizontal, 5.0)
            .foregroundColor(.white)
    }
}
