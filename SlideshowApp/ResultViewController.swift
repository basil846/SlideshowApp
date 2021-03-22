//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 森本記庸 on 2021/03/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var enlargedView: UIImageView!
    
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        enlargedView.image = image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
