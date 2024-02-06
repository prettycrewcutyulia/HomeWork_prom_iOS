//
//  CircleImage.swift
//  TutorialApple
//
//  Created by Юлия Гудошникова on 07.02.2024.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}
