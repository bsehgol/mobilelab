# This is an attempt...

## Egg timer ideation & drawing up a wire frame

![eggtimerwireframing](eggtimerwireframing.jpeg)

## Inspiration from Rollex gone awry..

![rollex](rollex.jpeg)


## On the third stage of development,  as intended red blinks every second, and comes into focus in 60 seconds, and then resets. Yellow is supposed to blink once a minute, so it looks blurry, on the 60th minute it is in full focus. Green is supposed to blink once every hour.

<iframe width="560" height="315" src="https://www.youtube.com/embed/K5V6C260MyM?start=34" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## On the second stage, experimented with blink and blur, and associated that with timer. The idea is to blink every second while blur fills up every minute. For this if you take a look at TimeDisplay.swift, the transforEffect function is used in line 23

```markdown
.transformEffect(CGAffineTransform(rotationAngle: CGFloat(.pi*timeRemaining)))
```
## It's all over the place!

<iframe width="560" height="315" src="https://www.youtube.com/embed/u2P-6bNUz5A?start=34" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>






