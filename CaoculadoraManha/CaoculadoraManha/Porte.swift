//
//  Porte.swift
//  CaoculadoraManha
//
//  Created by Lucas Daniel Costa da Silva on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
  case pequeno = "Pequeno"
  case médio = "Médio"
  case grande = "Grande"
  
  func calcularIdade(deAnos anosCaninos: Int, emeses mesesCaninos: Int) -> Int {
    let multiplicador: Int
    
    switch self {
    case .pequeno:
      multiplicador = 6
    case .médio:
      multiplicador = 7
    case .grande:
      multiplicador = 8
    }
    return (anosCaninos * multiplicador) + (multiplicador * (mesesCaninos / 12))
  }
}
