//
//  PDFViewController.swift
//  iDGN
//
//  Created by Maung Aung Naing Tun on 23/8/18.
//  Copyright © 2018 Maung Aung Naing Tun. All rights reserved.
//
import UIKit
//import WebKit
import PDFKit

var pdfDocument: PDFDocument!
var pdfSelectionArray: [PDFSelection]?

class PDFViewController: UIViewController, PDFViewDelegate{

    @IBOutlet weak var pdfTitle: UINavigationItem!
    // @IBOutlet weak var webView: UIWebView!

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        pdfTitle.title = contents[myPdfIndex]
        
        pdfDocument = PDFDocument (url: Bundle.main.url(forResource: contents[myPdfIndex], withExtension: "pdf")!)
            
        pdfView.displayMode = .singlePageContinuous
        pdfView.autoScales = true
        pdfView.document = pdfDocument
    }
}

//MARK: - Search bar methods
extension PDFViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        pdfSelectionArray = (pdfView.document?.findString(searchBar.text!, withOptions: .caseInsensitive))
        if pdfSelectionArray!.count != 0 {
            pdfSelectionArray![0].color = UIColor.yellow
            pdfView.highlightedSelections = pdfSelectionArray
            pdfView.go(to: pdfSelectionArray![0])
        }
        else{
            let temp = searchBar.text
            searchBar.text = "Couldn't find: " + temp!
            viewDidLoad()
        }
        
    }
}
    
   
    
    
    
    
    

    
    
    

    

