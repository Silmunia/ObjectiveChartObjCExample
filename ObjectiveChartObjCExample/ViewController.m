//
//  ViewController.m
//  ObjectiveChartObjCExample
//
//  Created by Pedro Henrique on 30/07/21.
//

#import "ViewController.h"
#import <ObjectiveChart/Charts/PieChart/Controller/PieChartController.h>
#import <ObjectiveChart/Charts/LineChart/LineChartController.h>

@interface ViewController ()

@property PieChartController *pieChart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.blackColor;
    
    // Creates points for the line
    LineChartData *pointA = [[LineChartData alloc] initWithName:@"A" value:2.0];
    LineChartData *pointB = [[LineChartData alloc] initWithName:@"B" value:10.5];
    LineChartData *pointC = [[LineChartData alloc] initWithName:@"C" value:7.3];
    
    // Creates a line using the created points
    LineChartComponent *lineA = [[LineChartComponent alloc] initWithTitle:@"LineA" color:UIColor.yellowColor thickness:1 data:@[pointA, pointB, pointC]];
    
    // Repeats the process for a second line
    LineChartData *pointD = [[LineChartData alloc] initWithName:@"D" value:-5.2];
    LineChartData *pointE = [[LineChartData alloc] initWithName:@"E" value:23.1];
    LineChartComponent *lineB = [[LineChartComponent alloc] initWithTitle:@"LineB" color:UIColor.blueColor thickness:1 data:@[pointD, pointE]];
    
    // Initializes the chart with a frame and lines created
    LineChartController *lineChart = [[LineChartController alloc] initWithFrame:CGRectMake(30, 75, 350, 350) data:@[lineA, lineB] axisColor:UIColor.greenColor backgroundColor:UIColor.clearColor];
    
    // Adds line chart to view
    [self.view addSubview:lineChart];
    
    // Creates the data objects for each segment in the pie chart
    PieChartData *part1 = [[PieChartData alloc] initWithTitle:@"A" value:50.0];
    PieChartData *part2 = [[PieChartData alloc] initWithTitle:@"B" value:150.0];
    PieChartData *part3 = [[PieChartData alloc] initWithTitle:@"C" value:1250.0];
    PieChartData *part4 = [[PieChartData alloc] initWithTitle:@"A" value:750.0];
    
    // Creates the pie chart's segments using the data objects
    PieChartComponent *comp1 = [[PieChartComponent alloc] initWithModel:part1 color:UIColor.whiteColor];
    PieChartComponent *comp2 = [[PieChartComponent alloc] initWithModel:part2 color:UIColor.redColor];
    PieChartComponent *comp3 = [[PieChartComponent alloc] initWithModel:part3 color:UIColor.orangeColor];
    PieChartComponent *comp4 = [[PieChartComponent alloc] initWithModel:part4 color:UIColor.blueColor];
    
    // Initializes the Pie Chart Controller
    _pieChart = [[PieChartController alloc] init];
    
    // Sets database, chart background color and center circle
    _pieChart.database = @[comp1, comp2, comp3, comp4];
    _pieChart.backgroundColor = UIColor.clearColor;
    _pieChart.centerCircleRadius = 90.0;
    
    // Adds pie chart to view
    [self.view addSubview:_pieChart];
    
    // Sets constraints and positioning
    _pieChart.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *width = [_pieChart.widthAnchor constraintEqualToConstant:200];
    NSLayoutConstraint *height = [_pieChart.heightAnchor constraintEqualToConstant:200];
    NSLayoutConstraint *centerX = [_pieChart.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    NSLayoutConstraint *centerY = [_pieChart.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:200];
    
    [NSLayoutConstraint activateConstraints:@[width, height, centerX, centerY]];
    
}


@end
