(define (problem gripper)
	(:domain programming)
	(:objects
		ballat neighbor next - relation
		b1 b2 b3 roomA roomB empty - value
		robby left right - variable
	)
	(:init
		(assignment robby roomA)
		(assignment left empty)
		(assignment right empty)
		(achievable-2ary ballat left robby)
		(achievable-2ary ballat right robby)
		(ordinal-2ary neighbor)
		(ordinal-2ary next)
		(includes-2ary ballat b1 roomA)
		(includes-2ary ballat b2 roomA)
		(includes-2ary ballat b3 roomB)
		(includes-2ary neighbor roomA roomB)
		(includes-2ary neighbor roomB roomA)
		(includes-2ary next b1 b2)
		(includes-2ary next b2 b3)
	)
	(:goal (and
		(includes-2ary ballat b1 roomB)
		(includes-2ary ballat b2 roomB)
		(includes-2ary ballat b3 roomB)
	))
)
