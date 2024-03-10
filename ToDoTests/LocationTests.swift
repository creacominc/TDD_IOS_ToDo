// LocationTests.swift

import XCTest
@testable import ToDo
import CoreLocation

final class LocationTests: XCTestCase 
{

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_init_setsCoordinate() throws 
    {
        let coordinate = CLLocationCoordinate2D( latitude: 1,
                                                 longitude: 2 )
        let location = Location( name: "" ,
                                 coordinate: coordinate 
                                )
        let resultCoordinate = try XCTUnwrap( location.coordinate )
        XCTAssertEqual( resultCoordinate.latitude, 1, accuracy: 0.000_001 )
        XCTAssertEqual( resultCoordinate.longitude, 2, accuracy: 0.000_001 )
    }

}
