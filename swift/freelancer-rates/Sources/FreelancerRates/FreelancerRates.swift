let hoursInDay: Double = 8.0
let daysInMonth: Double = 22.0

func dailyRateFrom(hourlyRate: Int) -> Double {
    return Double(hourlyRate) * hoursInDay
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let monthlyRate = dailyRate * daysInMonth
    let monthlyRateWithDiscount = monthlyRate - ((monthlyRate * discount) / 100.00)
    return monthlyRateWithDiscount.rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let dailyRateWithDiscount = dailyRate - ((dailyRate * discount) / 100.00)
    return (budget / dailyRateWithDiscount).rounded(.down)
}
