//
//  PhotoSizesService.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//


class PhotoSizesService: APIService<PhotoSizesEndPoint> {
  
    func getPhotoSizeby(id: String, completion: @escaping CallBacksTypeAliase.photoSizesResponseCallback){
        request(target: .getPhotoSizes(id: id), completion: completion)
    }
 
}
