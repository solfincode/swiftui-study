//
//  ContentView.swift
//  Landmarks
//
//  Created by Q on 2020/07/23.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var body: some View {
        VStack(alignment:.leading) {
            MapView()
                .frame(height:300)
                .edgesIgnoringSafeArea(.top)
            CircleImage()
                .offset(x:80,y:-180)
                .padding(.bottom, -250.0)
            VStack(alignment:.leading){
                Text("Hello, San Francisco!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack(alignment:.top) {
                    
                    Text("Welcome to city")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                    
                    Text("| San Francisco")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }.padding(.top,10)
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ").padding(.top,20)
            }
            .padding()
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail()
    }
}

