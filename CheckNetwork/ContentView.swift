//
//  ContentView.swift
//  CheckNetwork
//
//  Created by Ipung Dev Center on 30/08/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//

import SwiftUI
import Network

struct ContentView: View {
    @EnvironmentObject var util : Utilities
    @State private var showModal = false
    
    var body: some View {
        VStack {
            Text("Hi, iOS Programmer")
            Button(action: {
                self.util.monitorNetwork()
                self.showModal.toggle()
            }){
                Text("Check Network")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            .padding()
            .sheet(isPresented: $showModal){
                ModalView(showModal: self.$showModal, isConn: self.$util.isConn)
            }
        }
    }
}

//Modal View
struct ModalView: View {
    @Binding var showModal: Bool
    @Binding var isConn : Bool
    
    var body: some View {
        if isConn {
            return ZStack{
                Color.green
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "wifi")
                        .resizable()
                        .frame(width: 100, height: 80)
                    Text("Yea..I'm Online")
                        .font(.title).padding()
                    
                    Button (action: {
                        self.showModal.toggle()
                    }) {
                        Image(systemName: "xmark.circle")
                    }
                    
                }.foregroundColor(Color.white)
            }
            
        } else {
            return
                ZStack{
                    Color.red
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Image(systemName: "xmark.icloud")
                            .resizable()
                            .frame(width: 100, height: 80)
                        Text("Uhmm..I'm Offline")
                            .font(.title).padding()
                        
                        Button (action: {
                            self.showModal.toggle()
                        }) {
                            Image(systemName: "xmark.circle")
                        }
                    }
                    .foregroundColor(Color.white)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
