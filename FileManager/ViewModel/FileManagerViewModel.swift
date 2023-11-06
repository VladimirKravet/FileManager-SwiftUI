//
//  FileManagerViewModel.swift
//  FileManager
//
//  Created by Vladimir Kravets on 30.10.2023.
//

import Foundation
import SwiftUI

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var infoMessage: String = ""
    let imageName: String = "st-mary-lake-and-wild-goose-island-in-glacier-national-park-1928877"
    let manager = LocalFileManager.instance
    
    init() {
       getImageFromAssetsFolder()
     //   getImageFromFileManager()
    }
    func getImageFromAssetsFolder(){
        image = UIImage(named: imageName)
        
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: imageName)
    }
    
    func saveImage() {
        guard let image = image else {return}
        infoMessage = manager.saveImage(image: image, name: imageName)
    }
    func deletImmage() {
        infoMessage = manager.deletImage(name: imageName)
        manager.deleteFolder()
    }
}
 
