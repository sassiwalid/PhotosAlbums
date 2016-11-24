//
//  ViewController.swift
//  showAlbums
//
//  Created by Walid Sassi on 24/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var Table: UITableView!
    var albums = [Album]()
    override func viewDidLoad() {
        super.viewDidLoad()

       let api = APIManager()
        api.loadData("https://jsonplaceholder.typicode.com/albums",completion:didloadData)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func didloadData(albums:[Album])
    {
       self.albums = albums
      Table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return albums.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let album = albums[indexPath.row]
        cell.textLabel?.text = ("Album \(indexPath.row + 1)")
        cell.detailTextLabel?.text = album.title
        return cell
    }


}

