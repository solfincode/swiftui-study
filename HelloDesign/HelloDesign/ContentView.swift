//
//  ContentView.swift
//  HelloDesign
//
//  Created by Q on 2020/07/28.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            BackCardView()
                .offset(x:0,y:-80)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
//                .rotation3DEffect(Angle(degrees: 5),axis:(x:10.0,y:10.0,z:0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration:0.5))
            BackCardView()
                .offset(x:0,y:show ? -200 : -50)
                .offset(x:viewState.width,y:viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
//                .rotation3DEffect(Angle(degrees: 5),axis:(x:10.0,y:10.0,z:0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration:0.3))
            CardView()
                .offset(x:viewState.width,y:viewState.height)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged{
                        value in self.viewState = value.translation
                }
                .onEnded{
                    value in self.viewState = .zero
                }
            )
            
            BottomCardView()
                .offset(x:0,y:show ? -50 : 300)
//                .blur(radius: show ? 20 : 0)
                .animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack{
            Image("communication")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Hello Design")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    Text("this is awesome design cource")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }.padding(.bottom,20)
            
        }
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius:20)
        .padding(.top,20)
        .padding(.horizontal,20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{
            Text("Awesome courses")
            Spacer()
        }
        .frame(width:340,height:220)
        .padding(.top,30)
        .background(Color.green)
        .cornerRadius(20)
        .shadow(radius: 20)
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Courses")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                Image("writing")
            }.padding()
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack{
            Rectangle()
                .frame(width:40,height:5)
                .cornerRadius(3)
                .opacity(0.3)
            Text("This courses are proof that david to has achieved the UI Design course with approval from a Design academy instructor")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }
        .padding(.top,8)
        .padding(.horizontal,20)
        .frame(maxWidth:.infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius:30)
        .offset(x:0,y:500)
    }
}
