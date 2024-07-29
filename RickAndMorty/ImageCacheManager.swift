//
//  ImageCacheManager.swift
//  RickAndMorty
//
//  Created by User on 29.07.24.
//

import UIKit
class ImageCacheManager {
    static let shared = ImageCacheManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func cacheImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func getImage(forKey key: String) -> UIImage? {
        
        return cache.object(forKey: key as NSString)
    }
    
    func fetchImage(from urlString: String, completed : @escaping (UIImage) -> Void) {
        
        guard let url = URL(string:urlString) else {return}
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            
            completed(image)
        }
        
        NetworkManager.shared.fetchData(from: url) { [weak self] data, error  in
            guard let self = self else { return }
            if error != nil { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else {return }
            completed(image)
            
        }
    }
}
