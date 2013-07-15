CJWUIButtonScrollView
==================

This UIScrollView class builds a scroll view of button objects.

Each button can contain multiple labels and images as well as a dictionary of information.

To create a CJWUIButtonScrollView inside another view:

	self.buttonScrollView = [[CJWUIButtonScrollView alloc] initWithFrame:CGRectMake(0, 50, frame.size.width, frame.size.height-50-40-10)];
	[self.buttonScrollView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.1 blue:0.5 alpha:1.0]];
	self.buttonScrollView.buttonSpacing = 1;
	self.buttonScrollView.delegate2 = self;
	[self addSubview:self.buttonScrollView];

To create a CJWUIScrollButton and add it to the scroll view:

	NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
	CGSize buttonSize = CGSizeMake(320, 105);
	CJWUIScrollButton *button = [[CJWUIScrollButton alloc] initWithSize:buttonSize];
	[button addImage:CGRectMake(90, 3, 15, 9) image:[UIImage imageNamed:@"repost.png"]];
	[button addLabel:CGRectMake(110, 23, 200, 15) text:@"Hello" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:12]];
	[button addLabel:CGRectMake(110, 43, 200, 20) text:@"World" textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:12]];
	[button setFrame:CGRectMake(0, 0, buttonSize.width, buttonSize.height)];
	[button setBackgroundColor:[UIColor whiteColor]];
	[button setDictionary:dictionary];
	[self.buttonScrollView addButton:button];
