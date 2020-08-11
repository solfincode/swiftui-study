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
    @State var showUpdate = false
    var body: some View {
        VStack{
            HStack{
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                    
                Spacer()
                AvartarView(showProfile: $showProfile)
                Button(action:{self.showUpdate.toggle()}){
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size:16,weight:.medium))
                        .frame(width:36,height:36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        
                }
                .sheet(isPresented:$showUpdate){
                    UpdateList()
                }
            }
            .padding(.horizontal)
            .padding(.top,30)
            ScrollView {
                VStack{
                    ScrollView(.horizontal) {
                        HStack(spacing:30) {
                            ForEach(sectionData){ item in
                                GeometryReader { geometry in
                                    SectionView(section: item)
                                        .rotation3DEffect(Angle(degrees: Double(geometry.frame(in:.global).minX-30)/20), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                                }
                                .frame(width:275,height:275)
                            }
                        }
                        .padding(30)
                        .padding(.bottom,30)
                    }
                    VStack {
                        ForEach(barData){ item in
                            ItemView(bar:item)
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
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        }
    }
}

struct SectionView: View {
    var section:Section
    var body: some View {
        VStack {
            HStack{
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width:200,alignment:.leading)
            .padding(.bottom,20)
            
            Text(section.text.uppercased())
                .foregroundColor(.white)
                .frame(maxWidth:.infinity,alignment: .leading)
            
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .padding(.top,20)
        .padding(.horizontal,50)
        .frame(width:275,height:275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct ItemView: View {
    var bar:Bar
    var body: some View {
        HStack{
            Image(systemName: "pencil.circle")
                .font(.system(size:30))
                .foregroundColor(.white)
            
            Text(bar.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(maxWidth:.infinity,alignment:.leading)
        .padding(20)
        .background(bar.color)
        .cornerRadius(20)
    }
}

struct Section: Identifiable{
    var id = UUID()
    var title: String
    var text: String
    var color: Color
}

let sectionData = [
    Section(title: "Prototype design in swiftui", text: "18 sections", color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
   Section(title: "Hello world in swiftui", text: "28 sections", color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))),
   Section(title: "Design principle", text: "18 sections", color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))

]

struct Bar:Identifiable{
    var id = UUID()
    var title: String
    var color: Color
}

let barData = [
    Bar(title:"hello figma tool",color:Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))),
    Bar(title:"Invision is new tool",color:Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
    Bar(title:"sketch is still good",color:Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
]
