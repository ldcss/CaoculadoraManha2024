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
  
  let portes = ["Pequeno", "Médio", "Grande"]
  @State var porteSelecionado = "Pequeno"
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 20) {
      git commit -m "<feat> add spacer, divider and logic to calculate dog age"
      Text("Qual a idade do seu cão?")
      Text("Anos")
      TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
      Text("Meses")
      TextField("Quantos meses além disso ele tem", value: $months, format: .number)
      Text("Porte")
      
      Picker("Portes", selection: $porteSelecionado) {
        ForEach(portes, id: \.self){ porte in
          Text(porte)
        }
      }.pickerStyle(.segmented)
      
      Divider()
      
      Spacer()
      
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
          .shadow(radius: 10)
      }
      
      Spacer()
      
      Button("Cãocular", action: processYears)
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
  
  func processYears(){
    print("cãocular")
    guard let years, let months else {
      print("campos não preenchidos")
      return
    }
    guard months > 0 || years > 0 else {
      print("pelo menos um campo deve ser maior que zero")
      return
    }
    
    let multiplicador: Int
    switch porteSelecionado {
    case "Pequeno":
      multiplicador = 6
    case "Médio":
      multiplicador = 7
    case "Grande":
      multiplicador = 8
    default:
      multiplicador = 0
    }
    result = (years * multiplicador) + (multiplicador * (months / 12))
  }
}

#Preview {
  ContentView()
}
