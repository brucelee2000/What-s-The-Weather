//
//  ViewController.swift
//  What's The Weather
//
//  Created by Yosemite on 1/13/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var cityName: UITextField!
    
    @IBOutlet weak var blurredView: UIVisualEffectView!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBAction func getWeatherButtonPressed(sender: UIButton) {
        self.view.endEditing(true)
       
        let city = cityName.text
        var cityString = city.stringByReplacingOccurrencesOfString(" ", withString: "")
        var urlString = "http://www.weather-forecast.com/locations/" + cityString + "/forecasts/latest"
        
        var url = NSURL(string: urlString)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (webData, webResponse, webError) in
            var data2Text = NSString(data: webData, encoding: NSUTF8StringEncoding)
            
            if data2Text!.containsString("<span class=\"phrase\">") {
                var contentArray = data2Text?.componentsSeparatedByString("<span class=\"phrase\">") as [String]
                var content1 = contentArray[1].componentsSeparatedByString("</span>") as [String]
                var weather = content1[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                self.weatherLabel.text = weather
            } else {
                self.weatherLabel.text = "Cannot find the city - please try again"
            }

            self.blurredView.hidden = false
            self.weatherLabel.hidden = false
        }
        
        task.resume()
        
        println(urlString)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}

