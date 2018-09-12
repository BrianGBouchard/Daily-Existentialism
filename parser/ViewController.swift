//
//  ViewController.swift
//  parser
//
//  Created by Brian Bouchard on 8/3/18.
//  Copyright © 2018 Brian Bouchard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate  {
    
    @IBOutlet weak var quoteLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*let quote_html = get_quote()
        let quote = quote_html.byConvertingHTMLToPlainText()
        quoteLabel.text = quote*/
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let quote_html = get_quote()
        let quote = quote_html.byConvertingHTMLToPlainText()
        quoteLabel.text = quote
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func linkClicked(sender: Any) {
        let link = clean_link()
        if let url = URL(string: link) {
            UIApplication.shared.openURL(url)
        }
    }
}
