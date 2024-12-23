library(plumber)

find_disease <- function(temperature, rainfall, humidity, wind_speed) {
  if (temperature >= 20 && temperature <= 30 &&
      rainfall >= 10 && rainfall <= 30 &&
      humidity > 90 && wind_speed >= 10 && wind_speed <= 20) {
    return("Blast Disease")
  } else if (temperature >= 25 && temperature <= 34 &&
             rainfall > 20 &&
             humidity > 70 && wind_speed > 20) {
    return("Bacterial Leaf Blight")
  } else if (temperature >= 25 && temperature <= 30 &&
             rainfall >= 5 && rainfall <= 20 &&
             humidity > 80 && wind_speed >= 10 && wind_speed <= 15) {
    return("Brown Spot")
  } else if (temperature >= 28 && temperature <= 32 &&
             rainfall >= 10 && rainfall <= 25 &&
             humidity > 90 && wind_speed >= 5 && wind_speed <= 15) {
    return("Sheath Blight")
  } else if (temperature >= 25 && temperature <= 30 &&
             rainfall > 15 &&
             humidity > 80 && wind_speed >= 10 && wind_speed <= 20) {
    return("False Smut")
  } else if (temperature >= 30 && temperature <= 35 &&
             rainfall >= 15 && rainfall <= 30 &&
             humidity > 75 && wind_speed >= 15 && wind_speed <= 25) {
    return("Tungro Disease")
  } else if (temperature >= 25 && temperature <= 30 &&
             rainfall >= 20 && rainfall <= 40 &&
             humidity > 85 && wind_speed < 10) {
    return("Stem Rot")
  } else {
    return("No disease detected")
  }
}

#* Classify disease based on input parameters
#* @param temperature The temperature in °C
#* @param rainfall The rainfall in cm
#* @param humidity The humidity in percentage
#* @param wind_speed The wind speed in kph
#* @get /classify_disease
function(temperature, rainfall, humidity, wind_speed) {
  temperature <- as.numeric(temperature)
  rainfall <- as.numeric(rainfall)
  humidity <- as.numeric(humidity)
  wind_speed <- as.numeric(wind_speed)
  
  # Directly return the result as a string
  find_disease(temperature, rainfall, humidity, wind_speed)
}
