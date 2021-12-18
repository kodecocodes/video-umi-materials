//: # Measurements and Units
import Foundation

let cycleRide = Measurement(value: 25, unit: UnitLength.kilometers)
cycleRide.converted(to: .miles)
cycleRide.converted(to: .scandinavianMiles)

let distanceCompleted = Measurement(value: 13, unit: UnitLength.kilometers)
cycleRide - distanceCompleted

let swim = Measurement(value: 2000, unit: UnitLength.meters)

let marathon = Measurement(value: 26, unit: UnitLength.miles) + Measurement(value: 285, unit: UnitLength.yards)

let run = marathon / 2

let triathalon = cycleRide + swim + run

triathalon.converted(to: .nauticalMiles)

triathalon > cycleRide
