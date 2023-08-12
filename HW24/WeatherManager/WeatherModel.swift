import Foundation

// MARK: - DailyWeather
struct WeatherData: Codable {
    let location: Location?
    let current: Current?
    let forecast: Forecast?
}

// MARK: - Current
struct Current: Codable {
    let lastUpdated: String?
    let tempC: Double?
    let isDay: Int?
    let condition: Condition?
    let feelslikeC: Double?
    let uv: Int?

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case feelslikeC = "feelslike_c"
        case uv
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String?
    let code: Int?
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String?
    let day: Day?
    let hour: [Hour]?
}
 
// MARK: - Day
struct Day: Codable {
    let maxtempC, mintempC, avgtempC: Double?
    let totalsnowCM: Int?
    let condition: Condition?

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case avgtempC = "avgtemp_c"
        case totalsnowCM = "totalsnow_cm"
        case condition
    }
}

// MARK: - Hour
struct Hour: Codable {
    let time: String?
    let tempC: Double?
    let isDay: Int?
    let condition: Condition?
    let feelslikeC: Double?

    enum CodingKeys: String, CodingKey {
        case time
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        case feelslikeC = "feelslike_c"
    }
}

// MARK: - Location
struct Location: Codable {
    let name, region, country: String?
    let lat, lon: Double?
    let tzID: String?
    let localtimeEpoch: Int?
    let localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
