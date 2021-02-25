//
//  FXHandyJSON.swift
//  im-client
//
//  Created by wq on 2020/6/13.
//  Copyright © 2020 IM. All rights reserved.
//

import Foundation
import KakaJSON

public protocol WDJSONPareCodable: Convertible { }
class WDJsonUtil: NSObject {

    /** json -> model */
    static func jsonToModel<T:WDJSONPareCodable>(_ jsonString: String?, _ modelType: T.Type) -> T? {
        guard let jsonString = jsonString, jsonString.count > 0 else { return nil }
        return model(from: jsonString, modelType)
    }

    /** jsons -> model数组 */
    static func jsonToModelArray<T:WDJSONPareCodable>(_ jsonString: String?, _ modelType: T.Type) -> [T] {
        guard let jsonString = jsonString, jsonString.count > 0 else { return [] }
        return modelArray(from: jsonString, modelType)
    }

    /** 字典 -> model */
    static func dictionaryToModel<T:WDJSONPareCodable>(_ dictionary: [String: Any]?, _ modelType: T.Type) -> T? {
        guard let dictionary = dictionary, dictionary.count > 0 else { return nil }
        return model(from: dictionary, modelType)
    }

    /** 字典s -> models */
    static func dictionaryToModelArray<T:WDJSONPareCodable>(_ dictionarys: [[String: Any]]?, _ modelType: T.Type) -> [T] {
        guard let dictionarys = dictionarys, dictionarys.count > 0 else { return [] }
        return modelArray(from: dictionarys, modelType)
    }

    /** model -> 字典 */
    static func modelToDictionary<T:WDJSONPareCodable>(_ model: T?) -> [String: Any] {
        guard let model = model else { return [:] }
        return JSONObject(from: model)
    }

    /** model -> json */
    static func modelToJsonString<T:WDJSONPareCodable>(_ model: T?) -> String {
        guard let model = model else { return "" }
        return JSONString(from: model)
    }

}

