//
//  runpy.swift
//  Amrita Connect
//
//  Created by Vaisakhkrishnan K on 11/06/22.
//

import Foundation
import PythonKit

func runpy()
{
    let sys = Python.import("sys")
    sys.path.append("/Users/vaisakhkrishnank/Documents/Amrita Connect/Amrita Connect/")
    let example = Python.import("python")
    example.hello()
    
}
