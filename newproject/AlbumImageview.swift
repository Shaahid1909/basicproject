//
//  AlbumImageview.swift
//  newproject
//
//  Created by Shaahid on 29/09/21.
//

import UIKit

class AlbumImageview: UIViewController, UIScrollViewDelegate {
    

    var zoomimage: UIImage!
    
    @IBOutlet var detailImage: UIImageView!
    var scrollImg: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
     
        detailImage.image = zoomimage

        let vWidth = self.view.frame.width
        let vHeight = self.view.frame.height
        
        scrollImg = UIScrollView()
        scrollImg.delegate = self
        scrollImg.frame = CGRect(x: 0, y: 0, width: vWidth, height: vHeight)
        scrollImg.backgroundColor = UIColor(red: 90, green: 90, blue: 90, alpha: 0.90)
        scrollImg.alwaysBounceVertical = false
        scrollImg.alwaysBounceHorizontal = false
        scrollImg.showsVerticalScrollIndicator = true
        scrollImg.flashScrollIndicators()
        scrollImg.minimumZoomScale = 1.0
        scrollImg.maximumZoomScale = 3.0

        let doubleTapGest = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapScrollView(recognizer:)))
               doubleTapGest.numberOfTapsRequired = 2
        scrollImg.addGestureRecognizer(doubleTapGest)
        self.view.addSubview(scrollImg)
        scrollImg.addSubview((detailImage)!)
     
    }
    
    @objc func handleDoubleTapScrollView(recognizer: UITapGestureRecognizer) {
        if scrollImg.zoomScale == 1 {
            scrollImg.zoom(to: zoomRectForScale(scale: scrollImg.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
        } else {
            scrollImg.setZoomScale(1, animated: true)
        }
    }

    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = detailImage.frame.size.height / scale
        zoomRect.size.width  = detailImage.frame.size.width  / scale
        let newCenter = detailImage.convert(center, from: scrollImg)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }

    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.detailImage
    }

    
}

