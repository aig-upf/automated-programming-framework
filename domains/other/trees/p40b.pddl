(define (problem p40b)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 n28 n29 n30 n31 n32 n33 n34 n35 n36 n37 n38 n39 n40 - node )
	
  (:init
	( assignment current n34 )
	( internal n34 )
	( right-child n28 n34 )
	( internal n28 )
	( left-child n23 n28 )
	( internal n23 )
	( right-child n21 n23 )
	( left-child n6 n23 )
	( internal n6 )
	( right-child n30 n6 )
	( internal n30 )
	( right-child n13 n30 )
	( internal n13 )
	( right-child n24 n13 )
	( left-child n19 n13 )
	( internal n19 )
	( left-child n2 n19 )
	( internal n2 )
	( right-child n9 n2 )
	( internal n9 )
	( right-child n36 n9 )
	( left-child n17 n9 )
	( internal n17 )
	( left-child n15 n17 )
	( internal n15 )
	( left-child n3 n15 )
	( left-child n8 n2 )
	( internal n8 )
	( right-child n39 n8 )
	( internal n39 )
	( right-child n29 n39 )
	( internal n29 )
	( left-child n16 n29 )
	( internal n16 )
	( left-child n25 n16 )
	( internal n25 )
	( right-child n7 n25 )
	( left-child n14 n25 )
	( left-child n11 n39 )
	( internal n11 )
	( left-child n35 n11 )
	( left-child n12 n8 )
	( left-child n5 n30 )
	( internal n5 )
	( right-child n1 n5 )
	( internal n1 )
	( right-child n20 n1 )
	( left-child n22 n1 )
	( internal n22 )
	( left-child n18 n22 )
	( internal n18 )
	( left-child n27 n18 )
	( left-child n38 n5 )
	( internal n38 )
	( right-child n40 n38 )
	( internal n40 )
	( left-child n33 n40 )
	( internal n33 )
	( right-child n37 n33 )
	( internal n37 )
	( right-child n26 n37 )
	( left-child n32 n33 )
	( left-child n10 n38 )
	( left-child n31 n6 )
	( left-child n4 n34 ) )
  (:goal
	( and 
	( visited n34 )
	( visited n28 )
	( visited n23 )
	( visited n21 )
	( visited n6 )
	( visited n30 )
	( visited n13 )
	( visited n24 )
	( visited n19 )
	( visited n2 )
	( visited n9 )
	( visited n36 )
	( visited n17 )
	( visited n15 )
	( visited n3 )
	( visited n8 )
	( visited n39 )
	( visited n29 )
	( visited n16 )
	( visited n25 )
	( visited n7 )
	( visited n14 )
	( visited n11 )
	( visited n35 )
	( visited n12 )
	( visited n5 )
	( visited n1 )
	( visited n20 )
	( visited n22 )
	( visited n18 )
	( visited n27 )
	( visited n38 )
	( visited n40 )
	( visited n33 )
	( visited n37 )
	( visited n26 )
	( visited n32 )
	( visited n10 )
	( visited n31 )
	( visited n4 )
	)
  )
)