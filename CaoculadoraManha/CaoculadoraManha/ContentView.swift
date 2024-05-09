//
//  ContentView.swift
//  CaoculadoraManha
//
//  Created by Lucas Daniel Costa da Silva on 07/05/24.
//

import SwiftUI

struct ContentView: View {
  
  @State var years: Int?
  @State var months: Int?
  @State var result: Int?
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Qual a idade do seu cão?")
      
      Text("Anos")
      
      TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
      
      Text("Meses")
      
      TextField("Quantos meses além disso ele tem", value: $months, format: .number)
      
      Text("Porte")
      //segmented control
      
      if let result {
        Text("Seu cachorro tem, em idade humana...")
        Text("\(result) anos")
      } else {
        Image(ImageResource.clarinha)
          .resizable()
          .scaledToFit()
          .frame(maxHeight: 150)
  //      UIScreen.main.bounds.width
        .frame(maxWidth: .infinity)
      }
      
      Button("Cãocular"){
        result = 23
      }
      .frame(maxWidth: .infinity)
      .frame(height: 50)
      .background(.indigo)
      .foregroundStyle(.white)
      .clipShape(.rect(cornerRadius: 10))
      .bold()
    }
    .textFieldStyle(.roundedBorder)
    .keyboardType(.numberPad)
    .padding()
  }
}

#Preview {
  ContentView()
}
