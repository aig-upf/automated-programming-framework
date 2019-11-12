(define (problem prob5x3)
	(:domain maze)
	(:objects
		;current v1 v2 v3 v4 - variable
		current v1 v2 v3 v4 - variable
		c1x3 c2x3 c3x3 c4x3 c5x3
		c1x2 c2x2 c3x2 c4x2 c5x2
		c1x1 c2x1 c3x1 c4x1 c5x1 - node
	)
	(:init
		(assignment current c1x1)
		(west-child c1x3 c2x3)(west-child c2x3 c3x3)(west-child c3x3 c4x3)(west-child c4x3 c5x3)
		(west-child c1x2 c2x2)(west-child c2x2 c3x2)(west-child c3x2 c4x2)(west-child c4x2 c5x2)
		(west-child c1x1 c2x1)(west-child c2x1 c3x1)(west-child c3x1 c4x1)(west-child c4x1 c5x1)
		(east-child c2x3 c1x3)(east-child c3x3 c2x3)(east-child c4x3 c3x3)(east-child c5x3 c4x3)
		(east-child c2x2 c1x2)(east-child c3x2 c2x2)(east-child c4x2 c3x2)(east-child c5x2 c4x2)
		(east-child c2x1 c1x1)(east-child c3x1 c2x1)(east-child c4x1 c3x1)(east-child c5x1 c4x1)
		(north-child c1x3 c1x2)(north-child c2x3 c2x2)(north-child c3x3 c3x2)(north-child c4x3 c4x2)(north-child c5x3 c5x2)
		(north-child c1x2 c1x1)(north-child c2x2 c2x1)(north-child c3x2 c3x1)(north-child c4x2 c4x1)(north-child c5x2 c5x1)		
		(south-child c1x2 c1x3)(south-child c2x2 c2x3)(south-child c3x2 c3x3)(south-child c4x2 c4x3)(south-child c5x2 c5x3)
		(south-child c1x1 c1x2)(south-child c2x1 c2x2)(south-child c3x1 c3x2)(south-child c4x1 c4x2)(south-child c5x1 c5x2)
		(wall c2x1)(wall c2x2)(wall c4x3)(wall c4x2)
	)
	(:goal (and
		(visited c5x3)
	))
)
