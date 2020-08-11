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
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
                        .speed(2)
            )
            
            BackCardView()
                .background(Color.black)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y:-100)
                .offset(y:showCard ? -120 : -5)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(showCard ? 0 : 10))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration:0.5))
            BackCardView()
                .background(Color.green)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x:0,y:-20)
//                .offset(y:showCard ? -100 : -20)
//                .offset(x:viewState.width,y:viewState.height)
                .offset(x:0,y:showCard ? -100 : -15)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(showCard ? 0 : 5))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration:0.3))
            CardView()
                .offset(x:viewState.width,y:viewState.height)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                
                .frame(width:showCard ? 350 : 340.0,height:220.0)
                .background(Color.blue)
                .cornerRadius(20)
                .offset(y:showCard ? -50 : 0)
                .shadow(radius:20)
                .padding(.top,20)
                .padding(.horizontal,20)
                .onTapGesture {
                    self.showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged{value in
                            self.viewState = value.translation
                    }
                    .onEnded{
                        value in self.viewState = .zero
                    }
                )
            //get coordinate
//            Text("\(bottomState.height)").offset(y:-300)
            
            BottomCardView()
                .offset(x:0,y:showCard ? 5 : 400)
                .offset(y:bottomState.height)
                .animation(.timingCurve(0.2, 0.28, 0.2, 0.1))
                .gesture(
                    DragGesture().onChanged{value in
                        self.bottomState = value.translation
                        if self.showFull{
                            self.bottomState.height += -300
                        }
                        
                    }
                    .onEnded{value in
                        if self.bottomState.height>50{
                            self.showCard = false
                        }
                        if (self.bottomState.height < -100 && !self.showFull) || (self.bottomState.height < -250 && self.showFull){
                            self.showFull = true
                            self.bottomState.height = -300
                        }
                        else{
                            self.bottomState = .zero
                            self.showFull = false
                        }
                       
                    }
            )
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
                    Text("this is awesome design course")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }.padding(.bottom,20)
        }
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack{
            Spacer()
        }
        .frame(width:340,height:220)
        .padding(.top,30)
        
        
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
            }.padding()
//            Image("banner")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .padding(.top,-80)
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
                .multilineTextAlignment(.leading)
                .font(.headline)
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
