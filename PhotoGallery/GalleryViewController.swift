//
//  ViewController.swift
//  PhotoGalleryUnit
//
//  Created by YoungKil Kwon on 2016. 8. 15..
//  Copyright © 2016년 YoungKil Kwon. All rights reserved.
//
// reference : https://adoptioncurve.net/archives/2013/04/creating-a-paged-photo-gallery-with-a-uicollectionview/

import UIKit

class GalleryViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
//    @IBOutlet weak var collectionView: UICollectionView!
    var collectionView: UICollectionView!
    
    var dataArray: NSArray?
    
    let collectionContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.redColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loadImages()
        self.setupCollectionView()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadImages() {
        self.dataArray = ["1", "2", "3", "4", "5"]
        
    }
    
    
    func setupCollectionView() {
        //
        
        view.addSubview(collectionContainer)
        collectionContainer.frame = self.view.frame // CGRect(x: 0, y: 0, width: 100, height: 200)        
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
//        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        flowLayout.itemSize = CGSizeMake(320, 548)
        
        collectionView = UICollectionView(frame: collectionContainer.frame, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.whiteColor()
        self.collectionView.registerClass(GalleryCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.pagingEnabled = true
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionContainer.addSubview(collectionView)
        
    }
    

    // number of section in collection view
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
 
    // number of photos in collection view
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//         print("called numberOfItemsInSection \(self.dataArray!.count)")
        return self.dataArray!.count
    }
 
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellIdentifier", forIndexPath:indexPath) as! GalleryCell
        cell.backgroundColor = UIColor.blackColor()
        let imageName = self.dataArray?.objectAtIndex(indexPath.row) as! NSString
        cell.imageName = imageName
        cell.updateCell()
        return cell;
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//         return CGSizeMake(320, 548)
        return self.collectionView!.frame.size
    }
 
}

