//
//  RotatedBadgeSymbol.swift
//  TutorialApple
//
//  Created by Юлия Гудошникова on 07.02.2024.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle

    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}
