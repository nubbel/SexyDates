SexyDates
=========

SexyDates is an Objective-C category on NSNumber that allows you to create dates (NSDate objects) in a sexy, Rails-/ActiveSupport-like way: `@(3).days.ago`.

Installation
------------
Just add the two files `NSNumber+SexyDates.h` and `NSNumber+SexyDates` to your project and you're ready to go!

Usage examples
--------------
Sexy version:
```objc
@(1).minute.fromNow // In a minute
@(3).days.ago // Three days ago
[@(4).weeks since:@(1).day.fromNow] // Tomorrow in 4 weeks
[@(2).years until:@(1).day.ago] // Yesterday two years ago
```

Long version:
```objc
[[@(1) minute] fromNow] // In a minute
[[@(4) weeks] since:[[@(1) day] fromNow]] // Tomorrow in 4 weeks
```

Longest version:
```objc
[[[NSNumber numberWithInteger:1] minute] fromNow] // In a minute
```


You get the idea…

License
-------
**SexyDates** is released under the MIT license:

```
Copyright (c) <2013> <Dominique d'Argent>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```