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
    static var withPage = url + "&page=1&page_size=250"
}
//
//https://rebrickable.com/api/v3/lego/sets/?key=3014f8e704c3118058887c65f15b2ca5&page_size=500?theme_id=749
//https://rebrickable.com/api/v3/lego/sets/?key=3014f8e704c3118058887c65f15b2ca5&page=1&page_size=250&theme_id=246
