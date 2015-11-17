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
        
        // 5
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale;

        NSLog("zoomScale: %f", minScale)
        
        // 6
        // centerScrollViewContents()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZoomingInScrollView
    
    

}
