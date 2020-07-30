//
//  MenuView.swift
//  HelloDesign
//
//  Created by Q on 2020/07/30.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing: 16){
                Text("David - 50% completed")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Color.white
                    .frame(width:58,height:6)
                    .cornerRadius(3)
                    .frame(width:130,height:6,alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width:150,height:24)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(12)
                MenuRow(title: "Account",icon: "gear")
                MenuRow(title: "Billing",icon: "creditcard")
                MenuRow(title: "Sign Out",icon: "person.crop.circle")
                
                    
            }
            .frame(maxWidth:.infinity)
            .frame(height:300)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .clipShape(RoundedRectangle(cornerRadius:30,style:.continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal,30)
            .overlay(
                Image("tree")
                .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:60,height:60)
                    .clipShape(Circle())
                    .offset(y:-150)
                
            )
        
        }
        .padding(.bottom, 5)
    }
   
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light)) .imageScale(.large)
                .frame(width:32,height:32)
                .foregroundColor(.white)
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width:120,alignment:.leading )
                .foregroundColor(.white)
            
        }
    }
}
