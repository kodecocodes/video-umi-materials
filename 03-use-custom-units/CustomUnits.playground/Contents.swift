//: # Custom Units
import Foundation

extension UnitLength {
  class var legos: UnitLength {
      UnitLength(symbol: "lg", converter: UnitConverterLinear(coefficient: 0.032))
  }
}

var legoBrick = Measurement(value: 1, unit: UnitLength.legos)

legoBrick.convert(to: .baseUnit())
legoBrick.convert(to: .inches)

class UnitConverterLogarithmic: UnitConverter {
  let coefficient: Double
  let logBase: Double
  
  init(coefficient: Double, logBase: Double) {
    self.coefficient = coefficient
    self.logBase = logBase
  }
    
  override func baseUnitValue(fromValue value: Double) -> Double {
    coefficient * log(value) / log(logBase)
  }
  
  override func value(fromBaseUnitValue baseUnitValue: Double) -> Double {
    exp(baseUnitValue * log(logBase) / coefficient)
  }
}


final class UnitRatio: Dimension {
  static let decibels = UnitRatio(symbol: "dB", converter: UnitConverterLinear(coefficient: 1))
  
  static let amplitudeRatio = UnitRatio(symbol: "", converter: UnitConverterLogarithmic(coefficient: 20, logBase: 10))
  
  static let powerRatio = UnitRatio(symbol: "", converter: UnitConverterLogarithmic(coefficient: 10, logBase: 10))
  
  override class func baseUnit() -> UnitRatio {
    UnitRatio.decibels
  }
}

var doubleVolume = Measurement(value: 2, unit: UnitRatio.powerRatio)
doubleVolume.convert(to: .decibels)




