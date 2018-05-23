(define (problem p50b)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 - columns  b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( adjacent-columns c2 c3 )
	( adjacent-columns c3 c4 )
	( adjacent-columns c4 c5 )
	( adjacent-columns c5 c6 )
	( adjacent-columns c6 c7 )
	( adjacent-columns c7 c8 )
	( adjacent-columns c8 c9 )
	( adjacent-columns c9 c10 )
	( adjacent-columns c10 c11 )
	( adjacent-columns c11 c12 )
	( adjacent-columns c12 c13 )
	( adjacent-columns c13 c14 )
	( adjacent-columns c14 c15 )
	( adjacent-columns c15 c16 )
	( adjacent-columns c16 c17 )
	( adjacent-columns c17 c18 )
	( adjacent-columns c18 c19 )
	( adjacent-columns c19 c20 )
	( adjacent-columns c20 c21 )
	( adjacent-columns c21 c22 )
	( adjacent-columns c22 c23 )
	( adjacent-columns c23 c24 )
	( adjacent-columns c24 c25 )
	( adjacent-columns c25 c26 )
	( adjacent-columns c26 c27 )
	( adjacent-columns c27 c28 )
	( adjacent-columns c28 c29 )
	( adjacent-columns c29 c30 )
	( adjacent-columns c30 c31 )
	( adjacent-columns c31 c32 )
	( adjacent-columns c32 c33 )
	( adjacent-columns c33 c34 )
	( adjacent-columns c34 c35 )
	( adjacent-columns c35 c36 )
	( adjacent-columns c36 c37 )
	( adjacent-columns c37 c38 )
	( adjacent-columns c38 c39 )
	( adjacent-columns c39 c40 )
	( adjacent-columns c40 c41 )
	( adjacent-columns c41 c42 )
	( adjacent-columns c42 c43 )
	( adjacent-columns c43 c44 )
	( adjacent-columns c44 c45 )
	( adjacent-columns c45 c46 )
	( adjacent-columns c46 c47 )
	( adjacent-columns c47 c48 )
	( adjacent-columns c48 c49 )
	( adjacent-columns c49 c50 )
	( handempty )
	( current-columns c35 )
	( goal-columns c11 )
	( ontable b19 )
	( on b13 b19 )
	( on b41 b13 )
	( on b36 b41 )
	( on b39 b36 )
	( on b24 b39 )
	( clear b24 )
	( ontable b4 )
	( on b50 b4 )
	( on b49 b50 )
	( on b46 b49 )
	( on b47 b46 )
	( on b23 b47 )
	( on b22 b23 )
	( on b7 b22 )
	( clear b7 )
	( ontable b1 )
	( on b45 b1 )
	( on b21 b45 )
	( on b44 b21 )
	( clear b44 )
	( ontable b3 )
	( clear b3 )
	( ontable b32 )
	( clear b32 )
	( ontable b16 )
	( clear b16 )
	( ontable b26 )
	( clear b26 )
	( ontable b10 )
	( clear b10 )
	( ontable b40 )
	( clear b40 )
	( ontable b37 )
	( clear b37 )
	( ontable b2 )
	( clear b2 )
	( ontable b18 )
	( clear b18 )
	( ontable b27 )
	( clear b27 )
	( ontable b43 )
	( clear b43 )
	( ontable b14 )
	( clear b14 )
	( ontable b48 )
	( clear b48 )
	( ontable b17 )
	( clear b17 )
	( ontable b12 )
	( clear b12 )
	( ontable b33 )
	( clear b33 )
	( ontable b31 )
	( clear b31 )
	( ontable b9 )
	( clear b9 )
	( ontable b34 )
	( clear b34 )
	( ontable b28 )
	( clear b28 )
	( ontable b6 )
	( clear b6 )
	( ontable b35 )
	( clear b35 )
	( ontable b20 )
	( clear b20 )
	( ontable b15 )
	( clear b15 )
	( ontable b8 )
	( clear b8 )
	( ontable b5 )
	( clear b5 )
	( ontable b29 )
	( clear b29 )
	( ontable b25 )
	( clear b25 )
	( ontable b11 )
	( clear b11 )
	( ontable b38 )
	( clear b38 )
	( ontable b30 )
	( clear b30 )
	( ontable b42 )
	( clear b42 ) )
  (:goal
	( and 
	( ontable b30 )
	( on b47 b30 )
	( on b25 b47 )
	( on b24 b25 )
	( on b5 b24 )
	( clear b5 )
	( ontable b11 )
	( on b8 b11 )
	( on b16 b8 )
	( on b37 b16 )
	( on b39 b37 )
	( on b35 b39 )
	( on b33 b35 )
	( clear b33 )
	( ontable b38 )
	( on b31 b38 )
	( on b21 b31 )
	( on b44 b21 )
	( on b10 b44 )
	( on b42 b10 )
	( on b41 b42 )
	( on b12 b41 )
	( on b1 b12 )
	( on b22 b1 )
	( on b46 b22 )
	( on b13 b46 )
	( clear b13 )
	( ontable b40 )
	( on b3 b40 )
	( on b18 b3 )
	( on b20 b18 )
	( on b6 b20 )
	( on b7 b6 )
	( on b17 b7 )
	( on b45 b17 )
	( on b48 b45 )
	( on b19 b48 )
	( on b49 b19 )
	( on b26 b49 )
	( on b2 b26 )
	( on b4 b2 )
	( on b34 b4 )
	( on b28 b34 )
	( clear b28 )
	( ontable b29 )
	( on b14 b29 )
	( on b50 b14 )
	( on b32 b50 )
	( clear b32 )
	( ontable b15 )
	( clear b15 )
	( ontable b27 )
	( clear b27 )
	( ontable b36 )
	( clear b36 )
	( ontable b9 )
	( clear b9 )
	( ontable b43 )
	( clear b43 )
	( ontable b23 )
	( clear b23 )
	)
  )
)