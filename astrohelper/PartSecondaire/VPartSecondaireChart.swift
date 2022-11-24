//
// Created by Stéphane on 11.11.22.
//

import SwiftUI
import SweBressaniDev

@available(iOS 15, macOS 12.0, *)
public struct VAstrologieChart: View {
    @Binding var bsSwe: SweCore
    @Binding var baBodies: [Bool]

    public init(bsSwe: Binding<SweCore>, baBodies: Binding<[Bool]>) {
        self._bsSwe = bsSwe
        self._baBodies = baBodies
    }

    public var body: some View {
        ZStack {
            VPartSecondaireZodiac(bsSwe: $bsSwe)
            ForEach(1...12, id: \.self) { i in
                VAstrologieAssetSigns(bsSwe: $bsSwe, siSign: i)
            }
            ForEach(1...4, id: \.self) { i in
                let angle = SweCore.Angles(rawValue: Int32(i))!
                VAstrologieAssetAngles(bsSwe: $bsSwe, saAngle: angle)
                VAstrologieAngles(bsSwe: $bsSwe, saAngle: angle)
            }
            VAstrologieHouses(bsSwe: $bsSwe)
            ForEach(1...12, id: \.self) { i in
                VAstrologieAssetHouses(bsSwe: $bsSwe, siHouse: i)
            }
            //
            ForEach(Array(zip(bsSwe.bodiesForLoop.indices, bsSwe.bodiesForLoop)), id: \.1) { i, b in
                if (baBodies[i]) {
                    VPartSecondaireBodies(bsSwe: $bsSwe, sbBodie: b, sbTransit: false)
                    VPartSecondaireBodies(bsSwe: $bsSwe, sbBodie: b, sbTransit: true)
                    VAstrologieAssetBodies(bsSwe: $bsSwe, sbBodie: b, sbTransit: false)
                    VAstrologieAssetBodies(bsSwe: $bsSwe, sbBodie: b, sbTransit: true)
                }
            }
        }
    }
}
