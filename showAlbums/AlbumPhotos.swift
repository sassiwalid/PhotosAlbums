//
//  AlbumPhotos.swift
//  showAlbums
//
//  Created by Walid Sassi on 24/11/2016.
//  Copyright © 2016 Walid Sassi. All rights reserved.
//

import UIKit
import Photos
class AlbumPhotos: UICollectionViewController {
    
    
    var imageArray = [UIImage]()
    override func viewDidLoad() {
        grabPhotos()
    }
    func grabPhotos() {
        
        let imgManager = PHImageManager.defaultManager()
        let requestOptions = PHImageRequestOptions()
        requestOptions.synchronous = true
        requestOptions.deliveryMode = .Opportunistic
        
        let fetchOptions = PHFetchOptions()
        if let fetchResult: PHFetchResult = PHAsset.fetchAssetsWithMediaType(.Image, options: fetchOptions){
            if fetchResult.count>0{
                for i in 0..<fetchResult.count{
                    imgManager.requestImageForAsset(fetchResult.objectAtIndex(i) as! PHAsset, targetSize: CGSize(width: 150,height: 150), contentMode: .AspectFill, options: requestOptions, resultHandler: {
                       
                        image, error in
                        self.imageArray.append(image!)
                        
                    })
                    
                }
            }
            else
                {
                    print("there is no photos")
                }
            
            }
        
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        let imageView = cell.viewWithTag(1)as! UIImageView
        imageView.image = imageArray[indexPath.row]
        return cell
    }

}
