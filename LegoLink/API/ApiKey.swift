//
//  ApiKey.swift
//  LegoLink
//
//  Created by Artur Jurkowski on 27/07/2023.
//

import Foundation

class ApiKey {
   static var key = "3014f8e704c3118058887c65f15b2ca5"
    static var url = "https://rebrickable.com/api/v3/lego/sets/?key=" + key
    static var withPage = url + "&page_size=500"
}

//https://rebrickable.com/api/v3/lego/themes/?key=3014f8e704c3118058887c65f15b2ca5
//https://rebrickable.com/api/v3/lego/themes/
