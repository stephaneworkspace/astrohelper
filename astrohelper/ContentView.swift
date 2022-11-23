//
//  ContentView.swift
//  astrohelper
//
//  Created by Stéphane on 23.11.22.
//

import SwiftUI
import SweBressaniDev
import Zip

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var siSelected: Int = 1
    @State private var sdNatal: Date = Date()
    @State var ssFirstName: String = "Stéphane"
    @State var ssSecondName: String = "Thomas"
    @State var ssThirdName: String = ""
    @State var ssLastName1: String = "Bressani"
    @State var ssLastName2: String = "Pedroli"
    @State var ssLastName3: String = ""
    @State private var bdLat: Double = 46.12
    @State private var bdLng: Double = 6.09
    @State private var biTimeZone: Int = 2
    @State private var swe: SweCore = SweCore(pathEphe: try! Zip.quickUnzipFile(Bundle.main.url(forResource: "ephem", withExtension: "zip")!).absoluteString, size: 400)
    @State private var stText: TextCore = TextCore(langue: .F)
    var body: some View {
        VStack {
            TabView {
                VStack {
                    VInput(
                        bdNatal: $sdNatal,
                        bsFirstName: $ssFirstName,
                        bsSecondName: $ssSecondName,
                        bsThirdName: $ssThirdName,
                        bsLastName1: $ssLastName1,
                        bsLastName2: $ssLastName2,
                        bsLastName3: $ssLastName3,
                        bdLat: $bdLat,
                        bdLng: $bdLng,
                        biTimeZone: $biTimeZone,
                        stText: stText)
                }
                .padding()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Données")
                    }
                }
                .tag(1)
                VStack {
                    VDignitesAstrales(bsSwe: $swe)
                }
                .padding()
                .tabItem {
                    VStack {
                        Image(systemName: "sparkles")
                        Text("Dignité et débilité astrale")
                    }
                    
                }
                .tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
