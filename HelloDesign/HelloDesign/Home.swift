//
//  Home.swift
//  HelloDesign
//
//  Created by Q on 2020/07/30.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
        HomeView(showProfile:$showProfile)
            .padding(.top,44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius:30,style: .continuous))
            .shadow(color:Color.black.opacity(0.2),radius: 20,x:0,y:20)
            .offset(y:showProfile ? -550 : 0)
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response:0.5,dampingFraction:0.6,blendDuration:0))
            .edgesIgnoringSafeArea(.all)
            .blur(radius: showProfile ? 3 : 0)
            
        MenuView()
            .background(Color.black.opacity(0.01))
            .offset(y: showProfile ? 0 : screen.height)
            .offset(y:viewState.height)
            .animation(.spring(response:0.5,dampingFraction:0.6,blendDuration:0))
            .onTapGesture {
                self.showProfile.toggle()
            }
            .gesture(
            DragGesture()
            .onChanged{
            value in self.viewState = value.translation
            }
            .onEnded{ value in
                if self.viewState.height > 50{
                    self.showProfile = false
                }
                self.viewState = .zero
            }
        )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



let screen = UIScreen.main.bounds
