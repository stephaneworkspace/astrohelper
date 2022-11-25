//
//  Created by Stéphane on 25.11.22.
//

import SwiftUI
import SweBressaniDev
import SVGView

@available(iOS 15, macOS 12.0, *)
public struct VAstrologieAssetPartsSecondaires: View {
    @Binding var bsSwe: SweCore
    @State var siPart: Int

    public init(bsSwe: Binding<SweCore>, siPart: Int) {
        self._bsSwe = bsSwe
        self._siPart = .init(initialValue: siPart)
    }

    public var body: some View {
        let h = bsSwe.partSecondaire(number: siPart)
        VStack {
            GeometryReader { geometry in
                SVGView(contentsOf: try! bsSwe.swec.asset_house(i: siPart))
                        .offset(x: h.oPx, y: h.oPy)
                        .frame(width: h.oSx, height: h.oSy)
            }
        }.frame(width: CGFloat(bsSwe.size), height: CGFloat(bsSwe.size))
    }
}
