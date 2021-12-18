//: # Custom Units
import Foundation

extension UnitLength {
  class var legos: UnitLength {
      return UnitLength(symbol: "lg", converter: UnitConverterLinear(coefficient: 0.032))
  }
}

let legoBrick = Measurement(value: 1, unit: UnitLength.legos)

legoBrick.converted(to: .baseUnit())
legoBrick.converted(to: .inches)

class UnitConverterLogarithmic: UnitConverter {
  let coefficient: Double
  let logBase: Double
  
  init(coefficient: Double, logBase: Double) {
    self.coefficient = coefficient
    self.logBase = logBase
  }
    
  override func baseUnitValue(fromValue value: Double) -> Double {
    return coefficient * log(value) / log(logBase)
  }
  
  override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
    return exp(baseUnitValue * log(logBase) / coefficient)
  }
}


final class UnitRatio: Dimension {
  static let decibels = UnitRatio(symbol: "dB", converter: UnitConverterLinear(coefficient: 1))
  
  static let amplitudeRatio = UnitRatio(symbol: "", converter: UnitConverterLogarithmic(coefficient: 20, logBase: 10))
  
  static let powerRatio = UnitRatio(symbol: "", converter: UnitConverterLogarithmic(coefficient: 10, logBase: 10))
  
  override class func baseUnit() -> UnitRatio {
    return UnitRatio.decibels
  }
}

let doubleVolume = Measurement(value: 2, unit: UnitRatio.powerRatio)
doubleVolume.converted(to: .decibels)




