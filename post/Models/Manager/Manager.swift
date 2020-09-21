//
//  Manager.swift
//  post
//
//  Created by Stone web on 21/09/20.
//

import UIKit
import Alamofire
import AlamofireImage

class Manager {
   class func getPostsList(page: Int, completion: @escaping (_ posts: [PostShow]) -> Void) {
        //1. utilizamos el pod Alamofire para indicarle la url que debe de conectarse y la respuesta de que tipo es
    Alamofire.request(ApiTarget.listAllPost.urlTarget, method: ApiTarget.listAllPost.method).responseJSON { response in
             //2. Creamos una condicion de que si listsSeries es = a un array tipo directorio entre
            if let listPosts = response.result.value as? [[String: Any]] {
                //3. creamos la array que contendra las series
                var listPost: [PostShow] = []
                //4. recorremos el listado de series
                for post in listPosts {
                    //5. Sacamos los valores de la serie
                    let userId = post["userId"] as? Int
                    let id = post["id"] as? Int
                    let title = post["title"] as? String
                    let body = post["body"] as? String
                    //6. creamos un objeto tipo TvShow para darle el valor encontrado anteriormente
                    let addList = PostShow()
                    addList.userId = userId
                    addList.id = id
                    addList.title = title
                    addList.body = body
                    //7. agregamos el contenido de la serie a nuestra array tipo TvShow
                    listPost.append(addList)
                }
                //8. retornamos el listado o la array de series
                completion(listPost)
             }
          }
    }
}

