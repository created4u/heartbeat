//
//  ContentView.swift
//  HeartBeat
//
//  Created by Milo Song on 5/19/23.
//

import SwiftUI

struct ContentView: View {
    
    let originalSize: CGFloat = 160
    
    @State private var name = "You"
    @State private var beating = false
    @State private var setting = false
    @State private var heartbeatRate: Double = 1.0
    @State private var heartbeatAmplitude: CGFloat = 200

    var body: some View {

        NavigationView {
            
            VStack {
                
                Spacer()
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: beating ? heartbeatAmplitude : originalSize, height: beating ? heartbeatAmplitude : originalSize)
                    .foregroundColor(.pink)
                    .animation(.spring().repeatForever(autoreverses: false).speed(heartbeatRate), value: beating)
                
                Spacer()
                
                VStack {
                    
                    Button {
                        beating.toggle()
                    } label: {
                        
                        VStack {
                            
                            Text("Heartbeat")
                            
                            Text("With")
                            
                            Text(name)
                        }
                        
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                    }
                }
            }
            .frame(height: 600)
            .toolbar {
                
                Image(systemName: "gear")
                    .foregroundColor(.pink)
                    .fontWeight(.bold)
                    .onTapGesture {
                        setting.toggle()
                        if beating == true {
                            beating.toggle()
                        }
                    }
            }
            .sheet(isPresented: $setting) {
                
                VStack {
                    
                    HStack {
                        
                        Text("你想要与谁同频共振")
                            .font(.headline)
                            .foregroundColor(.pink)
                        
                        TextField("心爱的人", text: $name)
                            .foregroundColor(.pink)
                            .padding(.all, 10)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(16)
                            .fontWeight(.bold)
                    }
                    .padding(.all)
                    
                    HStack {
                        
                        Text("心动频率")
                            .foregroundColor(.pink)
                            .padding(.all)
                            .font(.headline)

                        Slider(value: $heartbeatRate, in: 0.6...1)
                            .accentColor(.pink)
                            .padding(.all)
                    }
                    
                    HStack {
                        
                        Text("心跳幅度")
                            .foregroundColor(.pink)
                            .padding(.all)
                            .font(.headline)
                        
                        Slider(value: $heartbeatAmplitude, in: 200...UIScreen.main.bounds.width*0.8)
                            .accentColor(.pink)
                            .padding(.all)
                    }
                    
                    Spacer()
                    
                    HStack {
                        
                        Text("Code by 🐶")
                            .foregroundColor(.gray)
                    }
                    
                    HStack {
                        
                        Text("Code with")
                            .foregroundColor(.gray)
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(.pink)
                    }
                }
                .padding(.all)
                .presentationDetents([.fraction(0.45)])
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
