//
//  LocalFileManager.swift
//  FileManager
//
//  Created by Vladimir Kravets on 30.10.2023.
//

import SwiftUI

class LocalFileManager {
    
    static let instance = LocalFileManager()
    let folderName = "MyApp_Images"
    
    init() {
        creatFolderIfNeeded()
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        guard
            let data = image.jpegData(compressionQuality: 0.5),
            let path = getPathForImage(name: name)
        else {
            return "Error getting data."

        }
        
        //       let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //       let directory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        //        let directory3 = FileManager.default.temporaryDirectory
        //       let path = directory?.appendingPathComponent("\(name).jpg")
        //        print(directory)
        //        print(directory)
        //       print(path)
        //       print(directory3)

        do{
           try data.write(to: path)
            print(path)
            return "Success saving!"
        } catch let error {
           return "Error saving. \(error)"
        }
    }
    
    func creatFolderIfNeeded() {
        guard
            let path = FileManager
        .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
                print("Success creating folder.")
            } catch let error {
                print("Erroe creating folder. \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
        .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder")
        } catch let error {
            print("Error deleting folder \(error)")
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting data.")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    func deletImage(name: String) -> String {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
            return "Error getting data."
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Sucessfully deleted"
        } catch let error {
            return "Error deleting image. \(error)"
        }
    }
    
    
    func getPathForImage(name: String) -> URL? {
        guard let path = FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .appendingPathComponent("\(name).jpg") else {
            print("Error getting path.")
            return nil
        }
        return path
    }
}

