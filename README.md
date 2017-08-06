# MoMath Hackathon 2017: Dynamic Wall Behaviors
Built by:
- Warren Partridge
- Kevin Hu
- Jeane Carlos
- Tony Cheng

## The Math

In this project, we visualized several types of data sorting, the Fibonacci Sequence, Sine functions, the Fourier series, and a smiley face.

*Data sorting:*

By using each slat of the Dynamic Wall to represent a point of data via their depth, we visualized three sorting methods: bubble sort, selection sort, and insertion sort. Each sorting method runs on an array of randomly-generated slat data.

*The Fibonacci Sequence:*

By using each slat of the Dynamic Wall to represent a boolean value, where 0 is represented by a retracted slat and 1 is represented by an extended slat, we visualized the Fibonacci sequence (1:1, 2:1, 3:3, 4:5, 5:8, 6:13, 7: 21 ...).

We bundled boolean slats into groups of 4 to display all Fibonacci numbers up until the 46th element. This is because we wanted to use all 128 slats on the wall. The Fibonacci sequence grows like 1.61^n; therefore, if we wanted to reach the nth Fibonacci sequence, it would take 3.2*10^14th seconds to reach a Fibonacci number that would use the 128th slat.

*"Creased" Sine Function:*

Another way of representing numbers on the dynaimc wall is through creases on the wall.

*Fourier Series Convergence:*

By representing the numbers in the same way as above, we present the convergence of the Fourier series of the square wave to the square wave itself. Because we can use the wall to represent any function through the creases, we show a slideshow of the various partial sums of the Fourier series of the square wave. 

*Smiley face-shaped pattern:*

By applying the geometrical intersection conceptions on trigonometry function, we are able to generate various functure and compose it to visualized graph. We here generated smiley face by spliting slats into three pieces and middle piece stands for mouth and the stands for eyes.


## The Submission

MoMath's Dynamic Wall allowed us to illustrate these mathematical concepts in a physically engaging way. The concepts are difficult to visualize mentally - especially the sorting methods - but with the help of the wall they can be made appealling to audiences of all ages. The wall allowed us to see exactly how long the runtime of bubble sort is compared to the efficient runtime of insertion sort. It also allowed us to simulate a simple mathematical function, the Fibonacci sequence, as an interesting work of binary-based art.

## Additional Notes

We found that in order to compile any of our programs into .app files that can be streamed to the wall, the programs must be renamed to `Animation.pde` before compilation.