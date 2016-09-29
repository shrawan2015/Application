//
//  ViewController.swift
//  PageViewControler
//
//  Created by SKS on 27/09/16.
//  Copyright © 2016 PageViewControler. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController {

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(color: "Green"),
                self.newColoredViewController(color: "Red"),
                self.newColoredViewController(color: "Blue")]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)VC")
    }
    
    var customSC = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        
        //load first view controller
        
        
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            
            
        }
        
        self.addSegmentController()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func addSegmentController() {
        
        let items = ["Purple", "Green", "Blue"]
         customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
    
    
        let frame = UIScreen.main.bounds
        customSC.frame = CGRect(x:frame.minX + 10, y:frame.minY + 50,
                                width:frame.width - 20, height:frame.height*0.1)

    
    
        customSC.layer.cornerRadius = 5.0  // Don't let background bleed
        customSC.backgroundColor = UIColor.black
        customSC.tintColor = UIColor.white
        
        customSC.addTarget(self, action: Selector(("changeColor:")), for: .valueChanged)

    
        self.view.addSubview(customSC)
        self.view.bringSubview(toFront: customSC)

    }

    
    func changeColor(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1: break
            //self.view.backgroundColor = UIColor.green
        case 2: break
           // self.view.backgroundColor = UIColor.blue
        default: break
            //self.view.backgroundColor = UIColor.purple
        }
    }
    
    
}

    extension ViewController : UIPageViewControllerDataSource {
        
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
      
        
        guard let viewControllerIndec = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndec - 1
        
        
        guard previousIndex >= 0 else{
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else
        {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    
    
        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerBefore viewController: UIViewController) -> UIViewController? {

    
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
        
        
      }
    }

