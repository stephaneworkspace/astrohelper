//
//  VPartSecondaires.swift
//  astrohelper
//
//  Created by Stéphane on 25.11.22.
//

import SwiftUI
import SweBressaniDev

@available(iOS 15, macOS 12.0, *)
public struct VAstrologiePartSecondaires: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Binding var bsSwe: SweCore

    public init(bsSwe: Binding<SweCore>) {
        self._bsSwe = bsSwe
    }

    public var body: some View {
        let colorStroke: Color = colorScheme == .light ? .orange : .orange
        //VStack {
        //    DrawHouseTriangle(lines: bsSwe.partSecondaireLines()).fill(colorStroke)
        //}.frame(width: CGFloat(bsSwe.size), height: CGFloat(bsSwe.size))
        VStack {
            DrawHouseLine(lines: bsSwe.partSecondaireLines()).stroke(colorStroke, lineWidth: 1.0)
        }.frame(width: CGFloat(bsSwe.size), height: CGFloat(bsSwe.size))
    }
}
