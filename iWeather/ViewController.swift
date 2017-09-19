//
//  ViewController.swift
//  iWeather
//
//  Created by Van Ho Si on 9/19/17.
//  Copyright © 2017 Van Ho Si. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var indexBackground: Int = 0
    var indexQuote: Int = 0
    var indexLocation: Int = 0
    var temperatureC: Double = 0.0
    var temperatureF: Double = 0.0
    
    var background = [
        "Blood",
        "Sun",
        "Moon"
    ]
    
    var quote = [
        "Ligula Nullam Malesuada",
        "Sem Ridiculus Justo Amet",
        "Euismod Mattis Ultricies Vulputate Lorem",
        "Magna Porta Pellentesque",
        "Ligula Purus"
    ]
    
    var location = [
        "Ha Noi",
        "Hai Phong",
        "TP HCM",
        "Nghe An",
        "Vung Tau",
        "Buon Me Thuat"
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.build()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var labelTemperature: UILabel!
    
    
    @IBOutlet weak var unitTemperature: UIButton!
    
    
    @IBOutlet weak var labelLocation: UILabel!
    
    
    @IBOutlet weak var labelQuote: UILabel!
    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    @IBAction func actionChangeUnitTemperature(_ sender: UIButton) {
//        print("actionChangeUnitTemperature")
        let text = unitTemperature.title(for: .normal)!
        if(text == "C"){
            unitTemperature.setTitle("F", for: .normal)
            labelTemperature.text = String(temperatureF)
        }else{
            unitTemperature.setTitle("C", for: .normal)
            labelTemperature.text = String(temperatureC)
        }
    }
    
    @IBAction func actionButtonRefresh(_ sender: UIButton) {
        
        self.build()
        
    }
    
    func build(){
        //random background
        indexBackground = self.uiniqueRandomIndex(length: background.count, oldValue: indexBackground)
        
        backgroundImage.image = UIImage.init(named: background[indexBackground])
        
        
        //random quote
        indexQuote = self.uiniqueRandomIndex(length: quote.count, oldValue: indexQuote)
        
        labelQuote.text = quote[indexQuote]
        
        //random location
        indexLocation = self.uiniqueRandomIndex(length: location.count, oldValue: indexLocation)
        
        labelLocation.text = location[indexLocation]
        
        //random temperature
        self.generateTemperature()
        
        let text = unitTemperature.title(for: .normal)!
        if(text == "C"){
            labelTemperature.text = String(temperatureC)
        }else{
            labelTemperature.text = String(temperatureF)
        }
    }
    
    func uiniqueRandomIndex(length: Int, oldValue: Int) -> Int{
        var tempIndex = Int(arc4random_uniform(UInt32(length)))
        
        repeat{
            tempIndex = Int(arc4random_uniform(UInt32(length)))
        }while(tempIndex == oldValue)
        
        return tempIndex
    }
    
    func generateTemperature() {
        let value = Double(arc4random_uniform(18) + 14) + (Double(arc4random()) / Double(INT32_MAX))
        temperatureC = value
        temperatureF = (temperatureC * 1.8) + 32
        
        temperatureC = (temperatureC * 10).rounded() / 10
        temperatureF = (temperatureF * 10).rounded() / 10
    }
}

