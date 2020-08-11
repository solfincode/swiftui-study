//
//  UpdateStore.swift
//  HelloDesign
//
//  Created by Q on 2020/08/03.
//  Copyright © 2020 sol. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject{
    @Published var updates:[Update] = updateData
}
