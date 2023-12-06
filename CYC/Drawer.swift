//
//  Drawer.swift
//  CYC
//
//  Created by 이민영 on 2023/12/06.
//

import SwiftUI
//
//struct Drawer: View {
//    @State private var showSheet = false
//    @State private var number: Int = 1
//    @State private var dday: Int = 0
//    
//    var body: some View {
//        Text("\(dday)")
//        
//        ZStack(alignment: .top) {
//            
//            Button("Show Bottom Sheet") {
//                showSheet.toggle()
//            }
//            .tint(.black)
//            .buttonStyle(.borderedProminent)
//            .sheet(isPresented: $showSheet) {
//                VStack{
//                    Picker("Your age", selection: $dday) {
//                        ForEach(1...100, id: \.self) { number in
//                            Text("\(number)")
//                        }
//                    }.pickerStyle(.wheel)
//                    Button("complete"){
//                        
//                        showSheet = false
//                    }
//                    
//                }
//                .presentationDetents([ .medium, .large])
//                .presentationBackground(.thinMaterial)
//                
//                
//            }
//        }
//    }
//}
//
//#Preview {
//    Drawer()
//}
