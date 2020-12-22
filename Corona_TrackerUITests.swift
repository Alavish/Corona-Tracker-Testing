//
//  Corona_TrackerUITests.swift
//  Corona TrackerUITests
//
//  Created by Anthony Christopher on 12/2/20.
//  Copyright © 2020 Samabox. All rights reserved.
//

import XCTest

class Corona_TrackerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    
    //Test 1
    //Set up with error, very basic
    
    override func setUpWithError() throws {
        
        let app = XCUIApplication()
        
        app.launch()
        super.setUp()
        
        continueAfterFailure = false
        
    }
    
    
    //Test 2
    // Tear down with error ,basic
    
    override func tearDownWithError() throws {
        
        let app = XCUIApplication()
        
        app.launch()
        super.tearDown()
        
        continueAfterFailure = true;
        
    }
    
    
    // Tests search bar and its functions
    //Testing the search bar is essential, its how the user will get the information they want specifically. Learning to make sure its functional early helps alot. Wanted to use my phone to simulate however it wasnt working, I would want to test the search bar more intensively the following ways: Spaces, Testing horizontally(L/R), Searching Emoji Flags, voice writing while searching
    
    func testSearch() throws {
        
        //Searches for US in search bar
        let app = XCUIApplication()
        
        app.launch()
        
        app.buttons["Search"].tap()
        
        let textField = app.textFields["Search"]
        textField.typeText("United States")
        
        
        
        //Searches for country off screen
        let app2 = XCUIApplication()
        
        app2.launch()
        
        app2.buttons["Search"].tap()
        
        let textField2 = app.textFields["Search"]
        textField2.typeText("Italy")
        
        
        
        
        //Searches using special character
        //nothing will be shown
        let app3 = XCUIApplication()
        
        app3.launch()
        
        app3.buttons["Search"].tap()
        
        let textField3 = app.textFields["Search"]
        textField2.typeText("$")
        
        
        
        //Searches for lowercase
        //still shows result
        let app4 = XCUIApplication()
        
        app4.launch()
        
        app4.buttons["Search"].tap()
        
        let textField4 = app.textFields["Search"]
        textField4.typeText("mexico")
        
        
        
        //Searches for uppercase
        //still shows results
        
        let app5 = XCUIApplication()
        
        app5.launch()
        
        app5.buttons["Search"].tap()
        
        let textField5 = app.textFields["Search"]
        textField5.typeText("GERMANY")
        clearTextSearchField5.tap()
        
    }
    
    
    
    
    
    
    
    
    //Tests the buttons Update functions, along with other options it has
    //If the record was working properly I would test each option menu down the list. for an example for growth of cases Id test the share button for that and so on.
    //with more syntax knwodlege Id really like to test the canvas styles with buttons switching the phone horizontal etc. That allows more functionality at times.
    
    func testButtons() throws {
        
        //Tests first update button
        let app = XCUIApplication()
        app.launch()
        
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).buttons["More"].tap()
        
        XCTAssert(app.tables.cells.staticTexts["Update"].exists)
        
        
        
        //Tests second dotted button share option
        let app_2 = XCUIApplication()
        app_2.launch()
        
        app_2.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).swipeUp()
        
        let tablesQuery2 = app_2.tables
        tablesQuery2.children(matching: .cell).element(boundBy: 1).buttons["More"].tap()
        XCTAssert(tablesQuery2/*@START_MENU_TOKEN@*/.cells.staticTexts["Share"]/*[[".cells.staticTexts[\"Share\"]",".staticTexts[\"Share\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.exists)
        
        //Tests Deaths button
        let app_3 = XCUIApplication()
        app_3.launch()
        
        app_3.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).swipeUp()
        
        let tablesQuery3 = app_3.tables
        tablesQuery3.children(matching: .cell).element(boundBy: 1).buttons["More"].tap()
        XCTAssert(tablesQuery3.cells.staticTexts["Deaths"]
       
        
        
        //Tests third dotted button share option
        
        let app_4 = XCUIApplication()
        app_4.launch()
        
        app_4.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).swipeUp()
        
        let tablesQuery3 = app_3.tables
        tablesQuery3 .cells.containing(.staticText, identifier:"DAILY NEW CASES").buttons["More"].tap()
        XCTAssert(tablesQuery3.cells.staticTexts["Share"].exists)
        
        
        //Tets growth of cases logarthmic scale button
        let app_5 = XCUIApplication()
        app_5.launch()
        
        app_5.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).swipeUp()
        
        
        let tablesQuery4 = app_4.tables
        tablesQuery4.cells.containing(.staticText, identifier:"GROWTH OF CASES").buttons["More"].tap()
        XCTAssert(tablesQuery4.cells.staticTexts["Logarithmic Scale"].exists)
        
        
    }
    
    
    //Tests Information Circles that represent each coountry
    //I tested these because its a manual way to move country to country to get information it was important to test because you have to slide the screen around to use it and it also provides strong visuals for its user
    //With more syntax understanding I would test more places that arent in view, I would also view information update it and come back and time it to make sure information is being refreshed in a reasonable amount of time
    func testCircleLandScapes() throws{
        
        
        let app = XCUIApplication()
        app.launch()
        
        app.maps.otherElements["United States"].tap()
        XCTAssert(app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"United States").element/*[[".maps.containing(.other, identifier:\"Caracas\").element",".maps.containing(.other, identifier:\"Guatemala\").element",".maps.containing(.other, identifier:\"Mexico City\").element",".maps.containing(.other, identifier:\"Mexico\").element",".maps.containing(.other, identifier:\"Los Angeles\").element",".maps.containing(.other, identifier:\"San Francisco\").element",".maps.containing(.other, identifier:\"Washington\").element",".maps.containing(.other, identifier:\"United States\").element",".maps.containing(.other, identifier:\"New York\").element",".maps.containing(.other, identifier:\"Chicago\").element",".maps.containing(.other, identifier:\"Toronto\").element",".maps.containing(.other, identifier:\"Montréal\").element",".maps.containing(.other, identifier:\"Vancouver\").element",".maps.containing(.other, identifier:\"Winnipeg\").element",".maps.containing(.other, identifier:\"Regina\").element",".maps.containing(.other, identifier:\"Calgary\").element",".maps.containing(.other, identifier:\"Canada\").element",".maps.containing(.other, identifier:\"Yellowknife\").element"],[[[-1,17],[-1,16],[-1,15],[-1,14],[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[10]]@END_MENU_TOKEN@*/.exists)
       
                
        
        let app_2 = XCUIApplication()
        app_2.launch()
        
        let yellowknifeMap = app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Canada").element/*[[".maps.containing(.other, identifier:\"Guatemala\").element",".maps.containing(.other, identifier:\"Mexico City\").element",".maps.containing(.other, identifier:\"Mexico\").element",".maps.containing(.other, identifier:\"Los Angeles\").element",".maps.containing(.other, identifier:\"San Francisco\").element",".maps.containing(.other, identifier:\"Washington\").element",".maps.containing(.other, identifier:\"United States\").element",".maps.containing(.other, identifier:\"New York\").element",".maps.containing(.other, identifier:\"Chicago\").element",".maps.containing(.other, identifier:\"Toronto\").element",".maps.containing(.other, identifier:\"Montréal\").element",".maps.containing(.other, identifier:\"Vancouver\").element",".maps.containing(.other, identifier:\"Winnipeg\").element",".maps.containing(.other, identifier:\"Regina\").element",".maps.containing(.other, identifier:\"Calgary\").element",".maps.containing(.other, identifier:\"Canada\").element",".maps.containing(.other, identifier:\"Yellowknife\").element"],[[[-1,16],[-1,15],[-1,14],[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        yellowknifeMap.tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.otherElements["Canada"].tap()
        yellowknifeMap.tap()
        
        app_2/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Canada").element/*[[".maps.containing(.other, identifier:\"Guatemala\").element",".maps.containing(.other, identifier:\"Mexico City\").element",".maps.containing(.other, identifier:\"Mexico\").element",".maps.containing(.other, identifier:\"Los Angeles\").element",".maps.containing(.other, identifier:\"San Francisco\").element",".maps.containing(.other, identifier:\"Washington\").element",".maps.containing(.other, identifier:\"United States\").element",".maps.containing(.other, identifier:\"New York\").element",".maps.containing(.other, identifier:\"Chicago\").element",".maps.containing(.other, identifier:\"Toronto\").element",".maps.containing(.other, identifier:\"Montréal\").element",".maps.containing(.other, identifier:\"Vancouver\").element",".maps.containing(.other, identifier:\"Winnipeg\").element",".maps.containing(.other, identifier:\"Regina\").element",".maps.containing(.other, identifier:\"Calgary\").element",".maps.containing(.other, identifier:\"Canada\").element",".maps.containing(.other, identifier:\"Yellowknife\").element"],[[[-1,16],[-1,15],[-1,14],[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        
        
        let app_3 = XCUIApplication()
        app_3.maps.otherElements["Mexico"].tap()
        app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Yellowknife").element/*[[".maps.containing(.other, identifier:\"Caracas\").element",".maps.containing(.other, identifier:\"Guatemala\").element",".maps.containing(.other, identifier:\"Mexico City\").element",".maps.containing(.other, identifier:\"Mexico\").element",".maps.containing(.other, identifier:\"Los Angeles\").element",".maps.containing(.other, identifier:\"San Francisco\").element",".maps.containing(.other, identifier:\"Washington\").element",".maps.containing(.other, identifier:\"United States\").element",".maps.containing(.other, identifier:\"New York\").element",".maps.containing(.other, identifier:\"Chicago\").element",".maps.containing(.other, identifier:\"Toronto\").element",".maps.containing(.other, identifier:\"Montréal\").element",".maps.containing(.other, identifier:\"Vancouver\").element",".maps.containing(.other, identifier:\"Winnipeg\").element",".maps.containing(.other, identifier:\"Regina\").element",".maps.containing(.other, identifier:\"Calgary\").element",".maps.containing(.other, identifier:\"Canada\").element",".maps.containing(.other, identifier:\"Yellowknife\").element"],[[[-1,17],[-1,16],[-1,15],[-1,14],[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        /* CODE BELOW DOEST RUN */
    
        
        /*
         
        
        let app = XCUIApplication()
        app.launch()
        
        app.maps.otherElements["Italy"].tap()
        XCTAssert(app.maps.containing(.other, identifier:"Italy").element.exists)
                                        
                        
         let app = XCUIApplication()
         app.launch()
 
         app.maps.otherElements["Germany"].tap()
         XCTAssert(app.maps.containing(.other, identifier:"Germany").element.exists)
        
         let app = XCUIApplication()
         app.launch()
         
         app.maps.otherElements["New Zealand"].tap()
         XCTAssert(app.maps.containing(.other, identifier:"New Zealand").element.exists)
 
         let app = XCUIApplication()
         app.launch()
         
         app.maps.otherElements["Japan"].tap()
         XCTAssert(app.maps.containing(.other, identifier:"Japan").element.exists)
 
         let app = XCUIApplication()
         app.launch()
         
         app.maps.otherElements["Non Country"].tap()
         XCTAssert(app.maps.containing(.other, identifier:"Non Country").element.exists)
 
         let app = XCUIApplication()
         app.launch()
         
         app.maps.otherElements[""].tap()
         XCTAssert(app.maps.containing(.other, identifier:"").element.exists)
                             
         
        
 */
    }
    
    //Testing the share button
    //Tests share button of each collumn on the swipe up
    //with correct syntax I would test this vertically/horizontal, also I would test the botton sections if the record was working properly/ more reliable. I also would test this aspect on my phone personally so i could actually share it and see what it does/says in the texts with the information and hows its formatted
    func testshareButtons() throws{
        
        
        //Tests first dotted button share option
        let app = XCUIApplication()
        app.launch()
        
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).buttons["More"].tap()
        
        XCTAssert(app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Share"]/*[[".cells.staticTexts[\"Share\"]",".staticTexts[\"Share\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.exists)
        
        
        
        //Tests second dotted button share option
        let app_2 = XCUIApplication()
        app_2.launch()
        
        app_2.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).swipeUp()
        
        let tablesQuery = app_2.tables
        tablesQuery.children(matching: .cell).element(boundBy: 1).buttons["More"].tap()
        XCTAssert(tablesQuery/*@START_MENU_TOKEN@*/.cells.staticTexts["Share"]/*[[".cells.staticTexts[\"Share\"]",".staticTexts[\"Share\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.exists)
        
       
        
        
        //Tests third dotted button share option
        
        let app_3 = XCUIApplication()
        app_3.launch()
        
        app_3.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).swipeUp()
        
        let tablesQuery2 = app_3.tables
        tablesQuery2 .cells.containing(.staticText, identifier:"DAILY NEW CASES").buttons["More"].tap()
        XCTAssert(tablesQuery/*@START_MENU_TOKEN@*/.cells.staticTexts["Share"]/*[[".cells.staticTexts[\"Share\"]",".staticTexts[\"Share\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.exists)
        
        
        //Tets fourth dotted button share option
        let app_4 = XCUIApplication()
        app_4.launch()
        
        app_4.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).swipeUp()
        
        
        let tablesQuery3 = app_4.tables
        tablesQuery3.cells.containing(.staticText, identifier:"GROWTH OF CASES").buttons["More"].tap()
        XCTAssert(tablesQuery3/*@START_MENU_TOKEN@*/.cells.staticTexts["Share"]/*[[".cells.staticTexts[\"Share\"]",".staticTexts[\"Share\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.exists)
        
        /*CODE BELOW DOES NOT WORK
         
        
        let app_5 = XCUIApplication()
        app_5.launch()
        
        //
        let app = XCUIApplication()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).swipeUp()
        
        
        let tablesQuery4 = app_5.tables
        
        tablesQuery4.cells.containing(.staticText, identifier:"GROWTH OF CASES").buttons["More"].swipeUp()
        tablesQuery4.cells.containing(.staticText, identifier:"MOST AFFECTED COUNTRIES").buttons["More"].tap()
        tablesQuery4/*@START_MENU_TOKEN@*/.staticTexts["Share"]/*[[".cells.staticTexts[\"Share\"]",".staticTexts[\"Share\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
         
 */
        
        
        
        
    }
    
    
    
    func testUpperButton() throws{
        
        //Testing Active Option in the layered button
        let appActiv = XCUIApplication()
        appActiv.launch()
        
        let layersButton = appActiv.buttons["Layers"]
        layersButton.tap()
        XCTAssert(appActiv.tables.staticTexts["Confirmed"].exists)
        
        //Testing Confirmed option in the layered button
        let appConfirmed = XCUIApplication()
        appConfirmed.launch()
        
        let layersButton_2 = appConfirmed.buttons["Layers"]
        layersButton_2.tap()
        XCTAssert(appConfirmed.tables.staticTexts["Active"].exists)
        
        //Testing Recovered Option in the layered button
        let appRecovered = XCUIApplication()
        appRecovered.launch()
        
        let layersButton_3 = appRecovered.buttons["Layers"]
        layersButton_3.tap()
        XCTAssert(appRecovered.tables.staticTexts["Recovered"].exists)
        
        //Teting Deaths Option in the layred button
        let appDeaths = XCUIApplication()
        appDeaths.launch()
        
        let layersButton_4 = appDeaths.buttons["Layers"]
        layersButton_4.tap()
        XCTAssert(appDeaths.tables.staticTexts["Deaths"].exists)
        
        
        
    }
    //Testing the launch
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
.
    }

    //tests performance for each launch
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}



// Summary

/* Overall I really enjoyed this project, trying to learn a new language and learning about testing in general was for sure hard, but learning how to make some tests and learning to search what I need to know helped me alot, I got alot of practice with swift and xcode and applications. The simulator was also a very new feature as far as my expierence goes, Ive never worked with a app on a phone simulator. It was super cool, I plan to learn how to use my phone for more efficient testing however due to license stuff etc I couldnt get it to do it, I also learned alot about what to test and how many small things that go unaccounted for in testing apps, these things include features like snapshots, phone flipping (portrait,horizontal etc.) these all play HUGE roles in he devlopment of a app and in the development in tests. Everything tests in portrait can be tested and needs to be tested horizontal. What if a user can only be in horizontal view, these are all important things to note in this proccess. I wanted to have alot more expeirence, I wish I knew how to test more aspects of this application, I wanted to test the following
 
    Data source - John Hopkins
        - i really wanted to test this because information is important, and getting that information to show on the screen accurately and efficiently is important. I would do this by going into the files finding the data source and test the function that allows the information to be sent. It would also be intresting to see what would happen if one of those states wasnt able to provide data for a while, what would that look like?
 Scrolling/Swiping
        - these two features made everything way more difficult, I really wanted to test how this app worked when refrencing different countries that werent viewable on the screen unless you slide across.
 
 
 Conclusion:
 
 I did not have alot of the syntax knowledge I needed, I got alot but not enough to figure out alot of the more advanced testing features in swift/xcode. I tried developing codes regardless of them running, I commented them out so that you can see my view, and my ideas and what I would ideally test, most of the syntax is correct however it doesnt account for the screen moving, the simulator did a really poor job of capturing map movement, so much to where it was extremely difficult to nearly impossible to test with the on screen iphone simulator. I commented out things I would want to test and why to try to make more sense with my testing and give this assignment more depth. I really wish I had more time to learn more xcode, but for the time i have taken I learned alot and plan to study more on my own with this language and application.
 
 
 
 
 
 */
