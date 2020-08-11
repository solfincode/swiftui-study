//
//  UpdateDetail.swift
//  HelloDesign
//
//  Created by Q on 2020/08/03.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update:Update = updateData[0]
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth:.infinity)
                Text(update.text)
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.horizontal,25)
                Spacer()
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
