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
  
  @State var porteSelected = Porte.pequeno
  @State var failedInput = false
  let tituloPreencherCampos = "Preencha campos para cãocular!"
  
  var body: some View {
    
    NavigationStack {
      ScrollView {
        VStack(alignment: .leading, spacing: 20) {
          
          Text("Qual a idade do seu cão?")
            .font(.header5)
          Text("Anos")
            .font(.body1)
          TextField("Quantos anos completos tem seu cão", value: $years, format: .number)
          Text("Meses").font(.body1)
          TextField("Quantos meses além disso ele tem", value: $months, format: .number)
          Text("Porte")
            .font(.body1)
          
          Picker("Portes", selection: $porteSelected) {
            ForEach(Porte.allCases, id: \.self){ porte in
              Text(porte.rawValue)
            }
          }.pickerStyle(.segmented)
          
          Divider()
          
          Spacer()
          
          if let result {
            Text("Seu cachorro tem, em idade humana...")
              .font(.body1)
              .frame(maxWidth: .infinity)
            Text("\(result) anos")
              .font(.display)
              .frame(maxWidth: .infinity)
              .contentTransition(.numericText())
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
            .font(.body1)
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
        .containerRelativeFrame(.vertical)
        .animation(.easeInOut.speed(0.5), value: result)
      }
      .alert(tituloPreencherCampos, isPresented: $failedInput, actions: {
        Button("OK", role: .cancel, action: {
          
        })
      })
      .navigationTitle("Cãoculadora")
      .scrollDismissesKeyboard(.immediately)
      .toolbarBackground(.indigo, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarColorScheme(.dark, for: .navigationBar)
    }
    .fontDesign(.rounded)
  }
  
  func processYears(){
    print("cãocular")
    guard let years, let months else {
      failedInput = true
      return
    }
    guard months > 0 || years > 0 else {
      print(
        "pelo menos um campo deve ser maior que zero"
      )
      return
    }
    
    result = porteSelected.calcularIdade(deAnos: years, emeses: months)
  }
}

#Preview {
  ContentView()
}
