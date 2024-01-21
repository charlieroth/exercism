let hoursInDay: Double = 8.0
let daysInMonth: Double = 22.0

func dailyRateFrom(hourlyRate: Int) -> Double {
    return Double(hourlyRate) * hoursInDay
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let monthlyRate = dailyRate * daysInMonth
    return monthlyRate - ((monthlyRate * discount) / 100.00)
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
  fatalError("Please implement the workdaysIn(budget:hourlyRate:withDiscount:) function")
}
