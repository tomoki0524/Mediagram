//
//  Popvar.swift
//  Mediagram
//
//  Created by 有賀智貴 on 2022/03/08.
//

import SwiftUI


struct PopOver : View {

    var body: some View{

        VStack(alignment: .leading, spacing: 18) {

            Button(action: {

            }) {

                HStack(spacing: 15){

                    Image(systemName: "house")
                        .renderingMode(.original)
                    Text("home")
                }
            }

            Divider()


            Button(action: {

            }) {

                HStack(spacing: 15){

                    Image(systemName: "magnifyingglass.circle.fill")
                        .renderingMode(.original)
                    Text("search")
                }
            }

            Divider()

            Button(action: {

            }) {

                HStack(spacing: 15){

                    Image(systemName: "heart.fill")
                        .renderingMode(.original)
                    Text("like")
                }
            }

            Divider()

            Button(action: {

            }) {

                HStack(spacing: 15){

                    Image(systemName: "person.fill")
                        .renderingMode(.original)
                    Text("account")
                }
            }
        }
        .foregroundColor(.black)
        .frame(width: 140)
        .padding()
        .padding(.bottom, 20)

    }
}


struct ArrowShape : Shape {

    func path(in rect: CGRect) -> Path {

        let center = rect.width / 2

        return Path{path in

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - 20))

            path.addLine(to: CGPoint(x: center - 15, y: rect.height - 20))
            path.addLine(to: CGPoint(x: center, y: rect.height - 5))
            path.addLine(to: CGPoint(x: center + 15, y: rect.height - 20))

            path.addLine(to: CGPoint(x: 0, y: rect.height - 20))
        }
    }
}


//struct PopOver : View {
//
//    var body: some View{
//
//        VStack(alignment: .leading, spacing: 18) {
//
//            Button(action: {
//
//            }) {
//
//                HStack(spacing: 15){
//
//                    Image(systemName: "house")
//                        .renderingMode(.original)
//                    Text("home")
//                }
//            }
//
//            Divider()
//
//
//            Button(action: {
//
//            }) {
//
//                HStack(spacing: 15){
//
//                    Image(systemName: "magnifyingglass.circle.fill")
//                        .renderingMode(.original)
//                    Text("search")
//                }
//            }
//
//            Divider()
//
//            Button(action: {
//
//            }) {
//
//                HStack(spacing: 15){
//
//                    Image(systemName: "heart.fill")
//                        .renderingMode(.original)
//                    Text("like")
//                }
//            }
//
//            Divider()
//
//            Button(action: {
//
//            }) {
//
//                HStack(spacing: 15){
//
//                    Image(systemName: "person.fill")
//                        .renderingMode(.original)
//                    Text("account")
//                }
//            }
//        }
//        .foregroundColor(.black)
//        .frame(width: 140)
//        .padding()
//        .padding(.bottom, 20)
//
//    }
//}
//
//
//
//struct ArrowShape : Shape {
//
//    func path(in rect: CGRect) -> Path {
//
//        let center = rect.width / 2
//
//        return Path{path in
//
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height - 20))
//
//            path.addLine(to: CGPoint(x: center - 15, y: rect.height - 20))
//            path.addLine(to: CGPoint(x: center, y: rect.height - 5))
//            path.addLine(to: CGPoint(x: center + 15, y: rect.height - 20))
//
//            path.addLine(to: CGPoint(x: 0, y: rect.height - 20))
//        }
//    }
//}
