(define (problem p100c)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 n28 n29 n30 n31 n32 n33 n34 n35 n36 n37 n38 n39 n40 n41 n42 n43 n44 n45 n46 n47 n48 n49 n50 n51 n52 n53 n54 n55 n56 n57 n58 n59 n60 n61 n62 n63 n64 n65 n66 n67 n68 n69 n70 n71 n72 n73 n74 n75 n76 n77 n78 n79 n80 n81 n82 n83 n84 n85 n86 n87 n88 n89 n90 n91 n92 n93 n94 n95 n96 n97 n98 n99 n100 - node )
	
  (:init
	( assignment current n35 )
	( internal n35 )
	( right-child n86 n35 )
	( internal n86 )
	( left-child n91 n86 )
	( internal n91 )
	( right-child n53 n91 )
	( internal n53 )
	( left-child n10 n53 )
	( internal n10 )
	( left-child n76 n10 )
	( internal n76 )
	( right-child n90 n76 )
	( internal n90 )
	( right-child n49 n90 )
	( left-child n79 n90 )
	( internal n79 )
	( right-child n31 n79 )
	( internal n31 )
	( left-child n8 n31 )
	( internal n8 )
	( right-child n82 n8 )
	( left-child n54 n8 )
	( internal n54 )
	( right-child n80 n54 )
	( internal n80 )
	( left-child n67 n80 )
	( internal n67 )
	( right-child n55 n67 )
	( internal n55 )
	( right-child n29 n55 )
	( internal n29 )
	( right-child n63 n29 )
	( left-child n98 n29 )
	( internal n98 )
	( left-child n59 n98 )
	( internal n59 )
	( right-child n46 n59 )
	( internal n46 )
	( right-child n7 n46 )
	( left-child n50 n46 )
	( left-child n4 n59 )
	( internal n4 )
	( left-child n9 n4 )
	( left-child n41 n55 )
	( left-child n5 n67 )
	( internal n5 )
	( left-child n42 n5 )
	( internal n42 )
	( left-child n89 n42 )
	( left-child n71 n54 )
	( internal n71 )
	( left-child n66 n71 )
	( internal n66 )
	( left-child n40 n66 )
	( internal n40 )
	( right-child n83 n40 )
	( internal n83 )
	( left-child n62 n83 )
	( internal n62 )
	( right-child n21 n62 )
	( internal n21 )
	( left-child n33 n21 )
	( internal n33 )
	( right-child n56 n33 )
	( left-child n93 n33 )
	( internal n93 )
	( right-child n64 n93 )
	( internal n64 )
	( left-child n81 n64 )
	( internal n81 )
	( right-child n14 n81 )
	( internal n14 )
	( right-child n36 n14 )
	( internal n36 )
	( right-child n16 n36 )
	( internal n16 )
	( right-child n3 n16 )
	( internal n3 )
	( left-child n43 n3 )
	( left-child n94 n16 )
	( left-child n100 n36 )
	( left-child n32 n14 )
	( left-child n77 n81 )
	( left-child n30 n93 )
	( left-child n15 n62 )
	( internal n15 )
	( left-child n61 n15 )
	( internal n61 )
	( right-child n1 n61 )
	( internal n1 )
	( left-child n34 n1 )
	( internal n34 )
	( right-child n45 n34 )
	( internal n45 )
	( right-child n92 n45 )
	( internal n92 )
	( left-child n28 n92 )
	( internal n28 )
	( right-child n38 n28 )
	( left-child n88 n28 )
	( internal n88 )
	( right-child n24 n88 )
	( left-child n52 n88 )
	( internal n52 )
	( right-child n6 n52 )
	( left-child n85 n52 )
	( internal n85 )
	( left-child n13 n85 )
	( left-child n97 n45 )
	( left-child n78 n34 )
	( internal n78 )
	( left-child n47 n78 )
	( left-child n74 n61 )
	( left-child n12 n40 )
	( left-child n57 n79 )
	( internal n57 )
	( left-child n44 n57 )
	( left-child n17 n76 )
	( internal n17 )
	( left-child n22 n17 )
	( left-child n58 n91 )
	( internal n58 )
	( left-child n19 n58 )
	( internal n19 )
	( left-child n69 n19 )
	( left-child n87 n35 )
	( internal n87 )
	( left-child n26 n87 )
	( internal n26 )
	( left-child n60 n26 )
	( internal n60 )
	( left-child n95 n60 ) )
  (:goal
	( and 
	( visited n35 )
	( visited n86 )
	( visited n91 )
	( visited n53 )
	( visited n10 )
	( visited n76 )
	( visited n90 )
	( visited n49 )
	( visited n79 )
	( visited n31 )
	( visited n8 )
	( visited n82 )
	( visited n54 )
	( visited n80 )
	( visited n67 )
	( visited n55 )
	( visited n29 )
	( visited n63 )
	( visited n98 )
	( visited n59 )
	( visited n46 )
	( visited n7 )
	( visited n50 )
	( visited n4 )
	( visited n9 )
	( visited n41 )
	( visited n5 )
	( visited n42 )
	( visited n89 )
	( visited n71 )
	( visited n66 )
	( visited n40 )
	( visited n83 )
	( visited n62 )
	( visited n21 )
	( visited n33 )
	( visited n56 )
	( visited n93 )
	( visited n64 )
	( visited n81 )
	( visited n14 )
	( visited n36 )
	( visited n16 )
	( visited n3 )
	( visited n43 )
	( visited n94 )
	( visited n100 )
	( visited n32 )
	( visited n77 )
	( visited n30 )
	( visited n15 )
	( visited n61 )
	( visited n1 )
	( visited n34 )
	( visited n45 )
	( visited n92 )
	( visited n28 )
	( visited n38 )
	( visited n88 )
	( visited n24 )
	( visited n52 )
	( visited n6 )
	( visited n85 )
	( visited n13 )
	( visited n97 )
	( visited n78 )
	( visited n47 )
	( visited n74 )
	( visited n12 )
	( visited n57 )
	( visited n44 )
	( visited n17 )
	( visited n22 )
	( visited n58 )
	( visited n19 )
	( visited n69 )
	( visited n87 )
	( visited n26 )
	( visited n60 )
	( visited n95 )
	)
  )
)