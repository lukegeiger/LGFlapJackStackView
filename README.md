# LGFlapJackStackView

[![Version](https://img.shields.io/cocoapods/v/LGFlapJackStackView.svg?style=flat)](http://cocoapods.org/pods/LGFlapJackStackView)
[![License](https://img.shields.io/cocoapods/l/LGFlapJackStackView.svg?style=flat)](http://cocoapods.org/pods/LGFlapJackStackView)
[![Platform](https://img.shields.io/cocoapods/p/LGFlapJackStackView.svg?style=flat)](http://cocoapods.org/pods/LGFlapJackStackView)

<p align="center">
  <img src="https://raw.githubusercontent.com/lukegeiger/LGFlapJackStackView/master/lukegeiger-flapjack.png">
</p>

## Motivation
When creating my app HoopMetrics, I found myself in need of a type of graph that would display the result of two numbers competing with one another in a specific category. The greater the difference in their competition, the more dominate it would appear visually. This is the type of graph that was my soloution to that problem. If you need to display a Head-To-Head matchup this graph may be useful for you.

## Usage
There are three classes that play together to make this graph happen. A LGFlapJack, a LGFlapJackCell, and a LGFlapJackView. All you need to do is create LGFlapJack model items, store them in array, and pass them to the LGFlapJackView, and the rest is handled for you.

```objective-c

    //For the purposes of this demo
    NSMutableArray*flapJacks = [NSMutableArray new];
    for (int i = 0; i<12; i++) {
        LGFlapJack *flapJack = [LGFlapJack new];
        flapJack.leftBarTotal = [NSNumber numberWithInt:[self getRandomNumberBetween:0 to:100]];
        flapJack.rightBarTotal = [NSNumber numberWithInt:[self getRandomNumberBetween:0 to:100]];
        flapJack.leftBarColor = [UIColor colorWithRed:17/255. green:159/255. blue:194/255. alpha:1.0];
        flapJack.rightBarColor = [UIColor colorWithRed:206/255. green:218/255. blue:60/255. alpha:1.0];
        flapJack.inlineString = [self randomCategoryName];
        [flapJacks addObject:flapJack];
    }
    
    self.lgFlapJackStackView = [[LGFlapJackStackView alloc]initWithFrame:self.view.bounds];
    self.lgFlapJackStackView.flapJacks = flapJacks;
    self.lgFlapJackStackView.flapJackHeight = 42;
    self.lgFlapJackStackView.tableFooterView = [self sampleFooterView];
    [self.view addSubview:self.lgFlapJackStackView];

```

## Edge Cases
As it sits right now, if one flapjacks right or left number is severely dominating, it pushes out the lesser number to a point where you cant see it displayed on the graph. I am looking to add a maximumWidth property on the bars soon.

## Possible Improvements
I want to add some sort of animation to this... But the animation should serve some purpose, and it shouldn't just animate just to animate.

## Installation

LGFlapJackStackView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LGFlapJackStackView"
```

## Author

Luke Geiger, lukejamesgeiger@gmail.com

## License

LGFlapJackStackView is available under the MIT license. See the LICENSE file for more info.
