//
//  ViewController.swift
//  PropertyListEncoderDecoder
//
//  Created by Saurabh Bisht on 20/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            
            var bundleMainPath = Bundle.main.path(forResource: "MyPropertyList", ofType: "plist")
            var toURL = URL(filePath: bundleMainPath!)
            
            var modelInstance = PModel(allowAccessToCamera: true, allowAccessToNetwork: false)
            
            // Encoder
            var encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            
            let encodedData =  try encoder.encode(modelInstance)
            print("Done Encoding..")
            try encodedData.write(to: toURL)
            
            //Decoder :
            
            var decoder = PropertyListDecoder()
            let decodedData = try decoder.decode(PModel.self, from: encodedData)
            print(decodedData)
            print("Done Decoding..")
            
            
        }catch(_){
            
        }
        
    }


}

struct PModel: Codable {
    var allowAccessToCamera: Bool
    var allowAccessToNetwork: Bool
    
    init(allowAccessToCamera: Bool, allowAccessToNetwork: Bool) {
        self.allowAccessToCamera = allowAccessToCamera
        self.allowAccessToNetwork = allowAccessToNetwork
    }
}

