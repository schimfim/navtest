//
//  ViewController.swift
//  navtest
//
//  Created by Frank Reine on 23.10.15.
//  Copyright © 2015 Frank Reine. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    // add image here
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Filter.resultImage = resultImage
        Filter.origImage = resultImage.image!
        
        scrollView.contentSize = Filter.origImage.size
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight);
        scrollView.minimumZoomScale = minScale;
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale;
        NSLog("zoomScale: %f", minScale)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return resultImage
    }
    
    

}
