//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by DOGUHAN on 28.01.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var city = String()
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weather: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityName.text = city
        getTodayResult(cityName: city)
        
     
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func getTodayResult(cityName: String) {
        let apiKey = "0f6112b1d663b03202ffabe9788c51ef"
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)") {
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    if let incomingData = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: incomingData, options: []) as? [String: Any]
                            
                            if let main = json?["main"] as? [String: Any], let temp = main["temp"] as? Double {
                                let temperatureInCelsius = Int(temp - 273.15)
                                
                                DispatchQueue.main.async {
                                    self.weather.text = "\(temperatureInCelsius)°C"
                                }
                            }
                            
                        } catch {
                            print("JSON serialization error: \(error.localizedDescription)")
                        }
                    }
                } else {
                    print("Error in data task: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
            task.resume()
        }
    }
}
