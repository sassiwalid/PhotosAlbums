//
//  ViewController.swift
//  showAlbums
//
//  Created by Walid Sassi on 24/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let api = APIManager()
        api.loadData("https://jsonplaceholder.typicode.com/albums",completion:didloadData)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func didloadData(albums:[Album])
    {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

