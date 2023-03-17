//
//  HomeView.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2021/09/30.
//

//import SwiftUI
//
//struct HomeView: View {
//
//
//
//    var body: some View {
//
//        VStack{
//        Text("Home View")
//
//        }
//    }
//}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

//import SwiftUI
//
//struct HomeView: View {
//
//
//
//    var body: some View {
//
//        NavigationView{
//            CustomTabView()
//                .navigationTitle("")
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarHidden(true)
//
//        }.accentColor(.red)
//    }
//}
//
//var tabs = ["house.fill", "magnifyingglass", "camera.viewfinder", "heart.fill", "person.fill"]
//
//struct CustomTabView: View {
//    @State var selectedTab = "house.fill"
//    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets
//
//    var body: some View{
//    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
//
//        NavigationView{
//        TabView(selection: $selectedTab) {
//            Main()
//                .tag("house.fill")
//            Search()
//                .tag("magnifyingglass")
//            Post()
//                .tag("camera.viewfinder")
//            Notifications()
//                .tag("heart.fill")
//            Profile()
//                .tag("person.fill")
//
//
//        }
//        }.accentColor(.pink)
//
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .ignoresSafeArea(.all, edges: .bottom)
//
//        HStack(spacing: 0) {
//            ForEach(tabs, id: \.self){
//               image in
//               TabButton(image: image, selectedTab: $selectedTab)
//
//                if image != tabs.last {
//                    Spacer(minLength: 0)
//                }
//            }
//        }
//        .padding(.horizontal, 25)
//        .padding(.vertical, 5)
//        .background(Color.white)
//        .clipShape(Capsule())
//        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
//        .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
//        .padding(.horizontal)
//        .padding(.bottom, edge!.bottom == 0 ? 20: 0)
//    }
//    .ignoresSafeArea(.keyboard, edges: .bottom)
//    .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
//    }
//}
//
//
//struct TabButton: View {
//    var image: String
//
//    @Binding var selectedTab: String
//
//    var body: some View {
//        Button(action: {selectedTab = image}) {
//
//            Image(systemName: "\(image)")
//                .foregroundColor(selectedTab == image ? Color.gray: Color.black)
//                .padding()
//        }
//    }
//}


import SwiftUI

struct HomeView: View {
   


    var body: some View {

        NavigationView{
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)

        }.accentColor(.red)
    }
}

var tabs = ["house.fill", "magnifyingglass", "camera.viewfinder", "heart.fill", "person.fill"]

struct CustomTabView: View {
    @State var selectedTab = "house.fill"
    @State var edge = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View{
    ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
        
      //  CardModalView()

        
        TabView(selection: $selectedTab) {
            Main()
                .tag("house.fill")
            Search()
                .tag("magnifyingglass")
            Post()
                .tag("camera.viewfinder")
            Notifications()
                .tag("heart.fill")
            Profile()
                .tag("person.fill")
    
        
        }.accentColor(.pink)

        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea(.all, edges: .bottom)

        HStack(spacing: 0) {
            ForEach(tabs, id: \.self){
               image in
               TabButton(image: image, selectedTab: $selectedTab)

                if image != tabs.last {
                    Spacer(minLength: 0)
                }
            }
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 5)
        .background(Color.white)
        .clipShape(Capsule())
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
        .padding(.horizontal)
        .padding(.bottom, edge!.bottom == 0 ? 20: 0)
    }
    .ignoresSafeArea(.keyboard, edges: .bottom)
    .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
    }
}


struct TabButton: View {
    var image: String

    @Binding var selectedTab: String

    var body: some View {
        Button(action: {selectedTab = image}) {

            Image(systemName: "\(image)")
                .foregroundColor(selectedTab == image ? Color.gray: Color.black)
                .padding()
        }
    }
}



//struct CardModalView: View {
//    @State private var offsets = (top: CGFloat.zero, middle: CGFloat.zero, bottom: CGFloat.zero)
//    @State private var offset: CGFloat = .zero
//    @State private var lastOffset: CGFloat = .zero
//    
//    var body: some View {
//        GeometryReader { geometry in
//            VStack (spacing: 30) {
//                RoundedRectangle(cornerRadius: 5)
//                    .foregroundColor(.gray)
//                    .frame(width: 100, height: 10)
//                Text("CardModal")
//                    .font(.largeTitle)
//                Spacer()
//            }
//            .padding()
//            .frame(width: geometry.size.width, height: geometry.size.height)
//            .background(Color.yellow)
//            .clipShape(RoundedRectangle(cornerRadius: min(self.offset, 20) ))
//            .animation(.interactiveSpring())
//            .onAppear {
//                self.offsets = (
//                    top: .zero,
//                    middle: geometry.size.height / 2,
//                    bottom: geometry.size.height * 3 / 4
//                )
//                self.offset = self.offsets.bottom
//                self.lastOffset = self.offset
//            }
//            .offset(y: self.offset)
//            .gesture(DragGesture(minimumDistance: 5)
//                .onChanged { v in
//                    let newOffset = self.lastOffset + v.translation.height
//                    if (newOffset > self.offsets.top && newOffset < self.offsets.bottom) {
//                        self.offset = newOffset
//                    }
//                }
//                .onEnded{ v in
//                    if (self.lastOffset == self.offsets.top && v.translation.height > 0) {
//                        if (v.translation.height < geometry.size.height / 2) {
//                            self.offset = self.offsets.middle
//                        } else {
//                            self.offset = self.offsets.bottom
//                        }
//                    } else if (self.lastOffset == self.offsets.middle) {
//                        if (v.translation.height < 0) {
//                            self.offset = self.offsets.top
//                        } else {
//                            self.offset = self.offsets.bottom
//                        }
//                    } else if (self.lastOffset == self.offsets.bottom && v.translation.height < 0) {
//                        if (abs(v.translation.height) > geometry.size.height / 2) {
//                            self.offset = self.offsets.top
//                        } else {
//                            self.offset = self.offsets.middle
//                        }
//                    }
//                    self.lastOffset = self.offset
//                }
//            )
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}
