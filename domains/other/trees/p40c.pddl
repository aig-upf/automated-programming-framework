(define (problem p40c)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 n28 n29 n30 n31 n32 n33 n34 n35 n36 n37 n38 n39 n40 - node )
	
  (:init
	( assignment current n40 )
	( internal n40 )
	( right-child n13 n40 )
	( left-child n4 n40 )
	( internal n4 )
	( left-child n28 n4 )
	( internal n28 )
	( right-child n7 n28 )
	( internal n7 )
	( left-child n34 n7 )
	( internal n34 )
	( right-child n12 n34 )
	( internal n12 )
	( right-child n20 n12 )
	( internal n20 )
	( right-child n16 n20 )
	( internal n16 )
	( right-child n8 n16 )
	( internal n8 )
	( left-child n33 n8 )
	( internal n33 )
	( left-child n1 n33 )
	( left-child n32 n16 )
	( left-child n30 n20 )
	( left-child n24 n34 )
	( internal n24 )
	( left-child n36 n24 )
	( internal n36 )
	( left-child n25 n36 )
	( left-child n15 n28 ) )
  (:goal
	( and 
	( visited n40 )
	( visited n13 )
	( visited n4 )
	( visited n28 )
	( visited n7 )
	( visited n34 )
	( visited n12 )
	( visited n20 )
	( visited n16 )
	( visited n8 )
	( visited n33 )
	( visited n1 )
	( visited n32 )
	( visited n30 )
	( visited n24 )
	( visited n36 )
	( visited n25 )
	( visited n15 )
	)
  )
)