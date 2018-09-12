//
//  data_parsing.swift
//  parser
//
//  Created by Brian Bouchard on 8/3/18.
//  Copyright © 2018 Brian Bouchard. All rights reserved.
//

import Foundation

func get_date() -> String {
    let date = Date()
    let dateString = String(date.description)
    let start = dateString.startIndex
    let end = dateString.index(start, offsetBy: 9)
    let date_substring = dateString[start...end]
    let currentDate = String(date_substring)
    return(currentDate)
}

func get_data() -> String {
    guard let myurl: URL = URL(string: "https://briangbouchard.github.io/phil_data_feed/") else {
        return ("nil")
    }
    do {
        let htmlcontents = try String(contentsOf: myurl, encoding: .ascii)
        return(htmlcontents)
    } catch {
        print("error")
        return ("error")
    }
}

func get_list() -> Array<String> {
    let html_contents = get_data()
    var html_array = html_contents.split(separator: "\n")
    var html_list = [String]()
    for item in html_array {
        html_list.append(String(item))
    }
    return html_list
}

func get_quote() -> String {
    let html_list = get_list()
    let current_date = get_date()
    var quote = "nil"
    for item in html_list {
        if item .contains(current_date) {
            let item_index = html_list.index(of: item)
            let quote_index = html_list.index(after: item_index!)
            quote = html_list[quote_index]
        }
    }
    return quote
}

func get_link() -> String {
    let html_list = get_list()
    let current_date = get_date()
    var link = "nil"
    for item in html_list {
        if item .contains(current_date) {
            let item_index = html_list.index(of: item)
            let quote_index = html_list.index(after: item_index!)
            let link_index = html_list.index(after: quote_index)
            link = html_list[link_index]
            
        }
    }
    return link
}

func clean_link() -> String {
    let link_html = get_link()
    let split_link = link_html.split(separator: ">")
    var link = String(split_link[1])
    let split_link_2 = link.split(separator: "<")
    link = String(split_link_2[0])
    return link
}


