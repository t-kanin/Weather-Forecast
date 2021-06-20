//
//  WeatherViewController.swift
//  Alamofire-Weather
//
//  Created by kanin tansirisittikul on 20/6/2564 BE.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var tempTextField: UITextField!
    @IBOutlet weak var scaleTextField: UITextField!
    @IBOutlet weak var searchtextField: UITextField!
    
    let forecastAPIKey = "692fc7857525f658afec78aa17e66352"
    let city = "leuven"
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground("bg2")
        searchtextField.delegate = self
        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecast("leuven")
    }
    
    /// retrieve the weather and put it in the textfield
    func forecast(_ city: String){
        forecastService.getCurrentWeather(city: city) { (currentWeather) in
            DispatchQueue.main.async {
                if let currentWeather = currentWeather {
                    if let temperature = currentWeather.temperature{
                        self.tempTextField.text = "\(temperature)°"
                    } else {self.tempTextField.text = "-"}
                }
                self.cityTextField.text = city.uppercased()
            }
        }
        
    }
    /// callback function when the search is tapped
    @IBAction func forebastWeather(_ sender: Any) {
        if let city = searchtextField.text{
            forecast(city)
        }else{ forecast("leuven")}
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
