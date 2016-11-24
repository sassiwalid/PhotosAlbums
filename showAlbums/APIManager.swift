//
//  APIManager.swift
//  showAlbums
//
//  Created by Walid Sassi on 24/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import Foundation
class APIManager
{
    func loadData (urlString:String, completion:(result:[Album])->())
    {
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        let url = NSURL(string:urlString)!
        let task = session.dataTaskWithURL(url)
        {
            (data,response,error) -> Void  in
            // pass data to the principal thread CallBack function
            
            if error != nil
            {
                dispatch_async(dispatch_get_main_queue())
                {
                    print(error!.localizedDescription)
                }
            }
            else
            {
                do
                {
                    if let json =  try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONArray
                    {
                        var albums = [Album]()
                        for entry in json{
                            let entry = Stations(data:entry as! JSONDictionnary)
                            stations.append(entry)
                        }
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority,0))
                        {
                            dispatch_async(dispatch_get_main_queue())
                            {
                                completion(result:albums)
                            }
                        }
                    }
                }
                catch
                {
                    dispatch_async(dispatch_get_main_queue())
                    {
                        print("Erreur in JSON Serialisation ")
                    }
                }
                // end Json serialisation
            }
        }
        task.resume()
}
}
