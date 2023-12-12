# ch7_staggered_animations

A new Flutter project.

Declaring SingleTickerProviderStateMixin to the AnimatedBalloonWidget widget class
allows us to set the AnimationController vsync argument.

The SingleTickeProviderStateMixin allows only one AnimationController.

We added AnimationController ande declared the _controller variable to animate both the 
floating upward or downward and inflation or deflation of the balloon.

We declared the _animationFloatUp varaible to hold the value form the Tween animation to show
the balloon either floating upward or downward by setting the top margin of the Container widget

We also declared the _animationGrowSize variable to hold the value from the Tween animation to 
show the balloon either inflating or deflating by setting the width value of the Container widget.

The AnimationBuilder contructor takes animation, builder, and child arguments.
Next, we passed the _animationFloatUp animation to the AnimatedBuilder constructor.

The Animatedbuilder builder argument returns a Container widget with the child as an Image wrapped in a GestureDetector widget.
