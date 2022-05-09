//: # MeasurementFormatter
import Foundation

let temperature = Measurement(value: 24, unit: UnitTemperature.celsius)

let formatter  = MeasurementFormatter()

formatter.string(from: temperature)

formatter.locale = Locale(identifier: "eu-ES")
formatter.string(from: temperature)

formatter.unitOptions = .temperatureWithoutUnit
formatter.string(from: temperature)


//: ## Unit Options
let run = Measurement(value: 20000, unit: UnitLength.meters)
formatter.unitOptions = .providedUnit
formatter.string(from: run)
formatter.unitOptions = .naturalScale
formatter.string(from: run)

//: ## Unit Style
formatter.unitStyle = .long
formatter.string(from: run)



//: ## Number formatter
let numberFormatter = NumberFormatter()
numberFormatter.minimumIntegerDigits = 6

formatter.numberFormatter = numberFormatter
formatter.string(from: run)
formatter.string(from: temperature)






