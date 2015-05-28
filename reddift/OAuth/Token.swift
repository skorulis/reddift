//
//  Token.swift
//  reddift
//
//  Created by sonson on 2015/05/28.
//  Copyright (c) 2015年 sonson. All rights reserved.
//

import Foundation

/**
Protocol for OAuthToken.
*/
public protocol Token {
    /// token information
    var accessToken: String {get}
    var tokenType: String {get}
    var expiresIn: Int {get}
    var _expiresIn: Int {get}
    var expiresDate: NSTimeInterval {get}
    var scope: String {get}
    var refreshToken: String {get}
    
    /// user name to identifiy token.
    var name: String {get}
    
    /// base URL of API
    static var baseURL: String {get}
    
    /// deserials Token from JSON data
    init(_ json:[String:AnyObject])
}

/**
Returns json binary data for token.

:param: token Token object to be serialised.
:returns: NSData object includes binary JSON file data.
*/
func jsonForSerializeToken(token:Token) -> NSData? {
    let dict:[String:AnyObject] = ["name":token.name, "access_token":token.accessToken, "token_type":token.tokenType, "expires_in":token.expiresIn, "expires_date":token.expiresDate, "scope":token.scope, "refresh_token":token.refreshToken]
    return NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.allZeros, error: nil)
}