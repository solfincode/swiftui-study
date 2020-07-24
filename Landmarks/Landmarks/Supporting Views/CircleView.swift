//
//  CircleImage.swift
//  Landmarks
//
//  Created by Q on 2020/07/23.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("tree")
            .frame(width: 200.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white,lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
