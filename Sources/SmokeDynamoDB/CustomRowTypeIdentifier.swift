// Copyright 2018-2019 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//
//  CustomRowTypeIdentifier.swift
//  SmokeDynamoDB
//

import Foundation

public protocol CustomRowTypeIdentifier {
    static var rowTypeIdentifier: String? { get }
}

func getTypeRowIdentifier(type: Any.Type) -> String {
    let typeRowIdentifier: String
    // if this type has a custom row identity
    if let customAttributesTypeType = type as? CustomRowTypeIdentifier.Type,
        let identifier = customAttributesTypeType.rowTypeIdentifier {
        typeRowIdentifier = identifier
    } else {
        typeRowIdentifier = String(describing: type)
    }
    
    return typeRowIdentifier
}
