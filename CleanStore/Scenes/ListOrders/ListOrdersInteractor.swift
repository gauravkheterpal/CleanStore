//
//  ListOrdersInteractor.swift
//  CleanStore
//
//  Created by Raymond Law on 10/31/15.
//  Copyright (c) 2015 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ListOrdersInteractorInput
{
  func fetchOrders(request: ListOrders.FetchOrders.Request)
  var orders: [Order]? { get }
}

protocol ListOrdersInteractorOutput
{
  func presentFetchedOrders(response: ListOrders.FetchOrders.Response)
}

class ListOrdersInteractor: ListOrdersInteractorInput
{
  var output: ListOrdersInteractorOutput!
  var ordersWorker = OrdersWorker(ordersStore: OrdersMemStore())
  
  var orders: [Order]?
  
  // MARK: - Fetch orders
  
  func fetchOrders(request: ListOrders.FetchOrders.Request)
  {
    ordersWorker.fetchOrders { (orders) -> Void in
      self.orders = orders
      let response = ListOrders.FetchOrders.Response(orders: orders)
      self.output.presentFetchedOrders(response)
    }
  }
}
