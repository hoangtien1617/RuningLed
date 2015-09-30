//
//  ViewController.m
//  RunningLed
//
//  Created by Hoàng Tiến on 9/29/15.
//  Copyright © 2015 Hoàng Tiến. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _margin;


    int _numberOfBall;
    CGFloat _space;
    CGFloat _ballDiameter;
}

- (void)viewDidLoad {
    _margin = 40.0;
    _ballDiameter   = 24.0;
    [super viewDidLoad];
    [self checkSizeScr];
    [self numberOfBall];
    [self drawRowOfBall:8 and:8];
    
    

}
-(CGFloat) spaceBetweenBall : (int)n{
    return (self.view.bounds.size.width - 2 * _margin) / (n-1);
    
}

-(void) numberOfBall {
    bool stop = false;
    int n= 3;
    while (!stop) {
        CGFloat space = [self spaceBetweenBall : n];
        if (space < _ballDiameter) {
            stop = true;
            
        }else{
            NSLog(@"Number of ball %d, space between ball %3.0f",n,space);
        }n++;
    }
    
}

-(void) placeBallOnScr : (CGFloat) x  andY
                       : (CGFloat) y withTag
                       : (int)tag
{
    
    UIImageView *ball = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"orange"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [self.view addSubview:ball];
}
-(void)checkSizeScr {
    NSLog(@"%3.0f x %3.0f",self.view.bounds.size.width,self.view.bounds.size.height);
}
-(void) drawRowOfBall : (int) numberOfBallsOnX and : (int)numberOfBallsOnY {
    CGFloat spacex = [self spaceBetweenBall:numberOfBallsOnX];
    CGFloat spacey = [self spaceBetweenBall:numberOfBallsOnY];

    for (int i = 0; i<numberOfBallsOnX; i++)
        for (int j = 0; j< numberOfBallsOnY; j++) {
            [self placeBallOnScr:_margin + i * spacex
                            andY:_margin + j * spacey + 120
             

                         withTag:i + 100];

        
            }
}

@end
