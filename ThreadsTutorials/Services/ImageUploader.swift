//
//  ImageUploader.swift
//  ThreadsTutorials
//
//  Created by YURIY IZBASH on 25. 9. 24.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image..")
            return nil
        }
    }
}
