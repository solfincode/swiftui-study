//
//  TabBar.swift
//  HelloDesign
//
//  Created by Q on 2020/08/03.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            Home().tabItem{
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
           ContentView().tabItem{
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
