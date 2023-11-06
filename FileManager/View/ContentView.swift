//
//  ContentView.swift
//  FileManager
//
//  Created by Vladimir Kravets on 30.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 200)
                        .clipped()
                        .cornerRadius(20)
                }
                HStack{
                    Button {
                        viewModel.saveImage()
                    } label: {
                        Text("Save to File Manager")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal,8)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    Button {
                        viewModel.deletImmage()
                    } label: {
                        Text("Delet from File Manager")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal,8)
                            .background(.red)
                            .cornerRadius(10)
                    }
                }
                Text(viewModel.infoMessage)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                    Spacer()
                }
                    .navigationTitle("File Manager")
            }
            .padding()
        }
    }

