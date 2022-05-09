//: # Measurements and Units
import Foundation

var cycleRide = Measurement(value: 25, unit: UnitLength.kilometers)
cycleRide.convert(to: .miles)
cycleRide.convert(to: .scandinavianMiles)

let distanceCompleted = Measurement(value: 13, unit: UnitLength.kilometers)
cycleRide - distanceCompleted

let swim = Measurement(value: 2000, unit: UnitLength.meters)

let marathon = Measurement(value: 26, unit: UnitLength.miles) + Measurement(value: 285, unit: UnitLength.yards)

let run = marathon / 2

var triathlon = cycleRide + swim + run

triathlon.convert(to: .nauticalMiles)

triathlon > cycleRide
