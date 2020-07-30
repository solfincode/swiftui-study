//
//  HomeView.swift
//  HelloDesign
//
//  Created by Q on 2020/07/30.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    var body: some View {
        VStack{
            HStack{
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                    
                Spacer()
                AvartarView(showProfile: $showProfile)
            }
            .padding(.horizontal)
            .padding(.top,30)
            ScrollView {
                VStack{
                    ScrollView(.horizontal) {
                        HStack(spacing:30) {
                            ForEach(0..<10){ item in
                                  SectionView()
                            }
                        }
                        .padding(30)
                        .padding(.bottom,30)
                    }
                    VStack {
                        ForEach(0..<3){ item in
                            ItemView()
                        }
                    }
                    .padding(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct AvartarView: View {
    @Binding var showProfile:Bool
    var body: some View {
        Button(action:{self.showProfile.toggle()}){
            Image("tree")
                .renderingMode(.original)
                .resizable()
                .frame(width:40,height:40)
                .clipShape(Circle())
        }
    }
}

struct SectionView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Prototype design in swiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width:160,alignment:.leading)
                    .foregroundColor(.white)
                Image(systemName: "pencil.circle")
                    .font(.system(size:60))
                    .foregroundColor(.white)
            }
            .padding(.bottom,20)
            Text("18 courses".uppercased())
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment: .leading)
            
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.top,20)
        .padding(.horizontal,20)
        .frame(width:275,height:275)
        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct ItemView: View {
    var body: some View {
        HStack{
            Image(systemName: "pencil.circle")
                .font(.system(size:30))
                .foregroundColor(.black)
            
            Text("Hello world in figma")
                .font(.headline)
                .fontWeight(.bold)
        }
        .frame(maxWidth:.infinity,alignment:.leading)
        .padding(20)
        .background(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
        .cornerRadius(20)
    }
}
