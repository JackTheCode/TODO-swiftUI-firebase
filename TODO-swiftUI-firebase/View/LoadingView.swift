//
//  LoadingView.swift
//  TODO-swiftUI-firebase
//
//  Created by phatnt on 5/21/20.
//  Copyright © 2020 phatnt. All rights reserved.
//

import Foundation
import SwiftUI

struct LoadingView: View {
    
    @State var isShowing: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .center) {
                VStack {
                    Text("Loading... ")
                    ActivityIndicator(isAnimating: true, style: .large)
                }
                .frame(width: geo.size.width / 2, height: geo.size.height)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }
}
