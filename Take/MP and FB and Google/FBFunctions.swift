//
//  FBFunctions.swift
//  Take
//
//  Created by Family on 6/1/18.
//  Copyright © 2018 N8. All rights reserved.
//

import CoreLocation
import FirebaseDatabase
import Foundation

func searchFBRouteCities(byProperty property: String, withValue value: Any, completion: @escaping (_ routeLocals: [City]) -> Void) {
    var routeCities: [City] = []
    let routeCitiesRoot = Database.database().reference(withPath: "cities")
    let namequery = routeCitiesRoot.queryOrdered(byChild: property).queryEqual(toValue: value)
    namequery.observeSingleEvent(of: .value) { snapshot in
        for item in snapshot.children {
            guard let item = item as? DataSnapshot, let newCity = City(snapshot: item) else { continue }
            routeCities.append(newCity)
        }
        completion(routeCities)
    }
}

func searchFBRouteWalls(byProperty property: String, withValue value: Any, completion: @escaping (_ routeLocals: [Wall]) -> Void) {
    var routeWalls: [Wall] = []
    let routeWallsRoute = Database.database().reference(withPath: "walls")
    let namequery = routeWallsRoute.queryOrdered(byChild: property).queryEqual(toValue: value)
    namequery.observeSingleEvent(of: .value) { snapshot in
        for item in snapshot.children {
            guard let item = item as? DataSnapshot, let newWall = Wall(snapshot: item) else { continue }
            routeWalls.append(newWall)
        }
        completion(routeWalls)
    }
}

func searchFBRouteAreas(byProperty property: String, withValue value: Any, completion: @escaping (_ routeLocals: [RouteArea]) -> Void) {
    var routeAreas: [RouteArea] = []
    let routeAreasRoot = Database.database().reference(withPath: "areas")
    let namequery = routeAreasRoot.queryOrdered(byChild: property).queryEqual(toValue: value)
    namequery.observeSingleEvent(of: .value) { snapshot in
        for item in snapshot.children {
            guard let item = item as? DataSnapshot, let newArea = RouteArea(snapshot: item) else { continue }
            routeAreas.append(newArea)
        }
        completion(routeAreas)
    }
}

func searchFBRoute(byProperty property: String, withValue value: Any, completion: @escaping (_ routes: [Route]) -> Void) {
//    var routeResults: [Route] = []
//    let routesRoot = Database.database().reference(withPath: "routes")
//    let namequery = routesRoot.queryOrdered(byChild: property).queryEqual(toValue: value)
//    namequery.observeSingleEvent(of: .value) { snapshot in
//        for item in snapshot.children {
//            guard let item = item as? DataSnapshot, let newRoute = Route(snapshot: item) else { continue }
//            routeResults.append(newRoute)
//        }
//        completion(routeResults)
//    }
}

func searchFBRoute(inArea path: String, completion: @escaping (_ routeIDs: [Int]) -> Void) {
    var routeResults: [Int] = []
    let routesRoot = Database.database().reference(withPath: "areas\(path)")
    routesRoot.observeSingleEvent(of: .value) { snapshot in
        for item in snapshot.children {
            guard let snap = item as? DataSnapshot, let myRoute = Int(snap.key) else { continue }
            routeResults.append(myRoute)
        }
        completion(routeResults)
    }
}

func searchFBArea(with key: String, completion: @escaping (_ area: Area) -> Void) {
//    let routesRoot = Database.database().reference(withPath: "areas/\(key)")
//    routesRoot.observeSingleEvent(of: .value) { snapshot in
//        guard let newArea = Area(snapshot: snapshot) else { return }
//        //        for item in snapshot.children {
//        //            print("item: \(item)")
//        //        }
//        completion(newArea)
//    }
}
