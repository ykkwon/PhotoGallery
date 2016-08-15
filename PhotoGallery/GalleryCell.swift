//
//  GalleryCell.swift
//  PhotoGalleryTest
//
//  Created by YK Kwon on 2016. 8. 14..
//  Copyright © 2016년 YK Kwon. All rights reserved.
//

import UIKit

class GalleryCell: UICollectionViewCell {
    var imageName: NSString?
//    @IBOutlet var imageView: UIImageView?
    let cellView: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor.blueColor()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    var imageView: UIImageView = {
//       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFit
//        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.userInteractionEnabled = true
//        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlePhotoClick)))
        

        return imageView
    }()
    
    let sectionInsets = UIEdgeInsets(top: 3, left: 2.0, bottom: 3, right: 2.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellowColor()
        super.addSubview(cellView)
        
        cellView.addSubview(imageView)
        imageView.leftAnchor.constraintEqualToAnchor(cellView.leftAnchor).active = true
        imageView.topAnchor.constraintEqualToAnchor(cellView.topAnchor).active = true
        imageView.widthAnchor.constraintEqualToAnchor(cellView.widthAnchor).active = true
        imageView.heightAnchor.constraintEqualToAnchor(cellView.heightAnchor).active = true
        
        cellView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
//        cellView.leftAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        cellView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        cellView.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        cellView.heightAnchor.constraintEqualToAnchor(self.heightAnchor).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func updateCell(){
        let image = UIImage(named: self.imageName as! String)
        self.imageView.image = image
        self.imageView.contentMode = .ScaleAspectFit
        print("cell frame:", frame)
        print("imageView:", self.imageView.frame)
    }
}
