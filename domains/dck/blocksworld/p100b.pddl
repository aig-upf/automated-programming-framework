(define (problem p100b)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56 c57 c58 c59 c60 c61 c62 c63 c64 c65 c66 c67 c68 c69 c70 c71 c72 c73 c74 c75 c76 c77 c78 c79 c80 c81 c82 c83 c84 c85 c86 c87 c88 c89 c90 c91 c92 c93 c94 c95 c96 c97 c98 c99 c100 - columns  b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 - block )
	
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
	( adjacent-columns c50 c51 )
	( adjacent-columns c51 c52 )
	( adjacent-columns c52 c53 )
	( adjacent-columns c53 c54 )
	( adjacent-columns c54 c55 )
	( adjacent-columns c55 c56 )
	( adjacent-columns c56 c57 )
	( adjacent-columns c57 c58 )
	( adjacent-columns c58 c59 )
	( adjacent-columns c59 c60 )
	( adjacent-columns c60 c61 )
	( adjacent-columns c61 c62 )
	( adjacent-columns c62 c63 )
	( adjacent-columns c63 c64 )
	( adjacent-columns c64 c65 )
	( adjacent-columns c65 c66 )
	( adjacent-columns c66 c67 )
	( adjacent-columns c67 c68 )
	( adjacent-columns c68 c69 )
	( adjacent-columns c69 c70 )
	( adjacent-columns c70 c71 )
	( adjacent-columns c71 c72 )
	( adjacent-columns c72 c73 )
	( adjacent-columns c73 c74 )
	( adjacent-columns c74 c75 )
	( adjacent-columns c75 c76 )
	( adjacent-columns c76 c77 )
	( adjacent-columns c77 c78 )
	( adjacent-columns c78 c79 )
	( adjacent-columns c79 c80 )
	( adjacent-columns c80 c81 )
	( adjacent-columns c81 c82 )
	( adjacent-columns c82 c83 )
	( adjacent-columns c83 c84 )
	( adjacent-columns c84 c85 )
	( adjacent-columns c85 c86 )
	( adjacent-columns c86 c87 )
	( adjacent-columns c87 c88 )
	( adjacent-columns c88 c89 )
	( adjacent-columns c89 c90 )
	( adjacent-columns c90 c91 )
	( adjacent-columns c91 c92 )
	( adjacent-columns c92 c93 )
	( adjacent-columns c93 c94 )
	( adjacent-columns c94 c95 )
	( adjacent-columns c95 c96 )
	( adjacent-columns c96 c97 )
	( adjacent-columns c97 c98 )
	( adjacent-columns c98 c99 )
	( adjacent-columns c99 c100 )
	( handempty )
	( current-columns c86 )
	( goal-columns c22 )
	( ontable b77 )
	( on b85 b77 )
	( on b58 b85 )
	( on b68 b58 )
	( on b54 b68 )
	( on b25 b54 )
	( on b50 b25 )
	( on b72 b50 )
	( on b74 b72 )
	( on b69 b74 )
	( on b35 b69 )
	( on b61 b35 )
	( on b27 b61 )
	( on b44 b27 )
	( clear b44 )
	( ontable b49 )
	( on b22 b49 )
	( clear b22 )
	( ontable b31 )
	( clear b31 )
	( ontable b11 )
	( clear b11 )
	( ontable b18 )
	( clear b18 )
	( ontable b10 )
	( clear b10 )
	( ontable b59 )
	( clear b59 )
	( ontable b21 )
	( clear b21 )
	( ontable b40 )
	( clear b40 )
	( ontable b47 )
	( clear b47 )
	( ontable b38 )
	( clear b38 )
	( ontable b14 )
	( clear b14 )
	( ontable b84 )
	( clear b84 )
	( ontable b34 )
	( clear b34 )
	( ontable b8 )
	( clear b8 )
	( ontable b53 )
	( clear b53 )
	( ontable b67 )
	( clear b67 )
	( ontable b95 )
	( clear b95 )
	( ontable b79 )
	( clear b79 )
	( ontable b3 )
	( clear b3 )
	( ontable b82 )
	( clear b82 )
	( ontable b45 )
	( clear b45 )
	( ontable b100 )
	( clear b100 )
	( ontable b36 )
	( clear b36 )
	( ontable b55 )
	( clear b55 )
	( ontable b19 )
	( clear b19 )
	( ontable b46 )
	( clear b46 )
	( ontable b60 )
	( clear b60 )
	( ontable b33 )
	( clear b33 )
	( ontable b32 )
	( clear b32 )
	( ontable b51 )
	( clear b51 )
	( ontable b94 )
	( clear b94 )
	( ontable b15 )
	( clear b15 )
	( ontable b91 )
	( clear b91 )
	( ontable b92 )
	( clear b92 )
	( ontable b43 )
	( clear b43 )
	( ontable b97 )
	( clear b97 )
	( ontable b81 )
	( clear b81 )
	( ontable b98 )
	( clear b98 )
	( ontable b65 )
	( clear b65 )
	( ontable b20 )
	( clear b20 )
	( ontable b90 )
	( clear b90 )
	( ontable b12 )
	( clear b12 )
	( ontable b16 )
	( clear b16 )
	( ontable b37 )
	( clear b37 )
	( ontable b75 )
	( clear b75 )
	( ontable b41 )
	( clear b41 )
	( ontable b24 )
	( clear b24 )
	( ontable b66 )
	( clear b66 )
	( ontable b86 )
	( clear b86 )
	( ontable b4 )
	( clear b4 )
	( ontable b48 )
	( clear b48 )
	( ontable b71 )
	( clear b71 )
	( ontable b99 )
	( clear b99 )
	( ontable b52 )
	( clear b52 )
	( ontable b7 )
	( clear b7 )
	( ontable b73 )
	( clear b73 )
	( ontable b13 )
	( clear b13 )
	( ontable b29 )
	( clear b29 )
	( ontable b80 )
	( clear b80 )
	( ontable b78 )
	( clear b78 )
	( ontable b9 )
	( clear b9 )
	( ontable b1 )
	( clear b1 )
	( ontable b63 )
	( clear b63 )
	( ontable b76 )
	( clear b76 )
	( ontable b2 )
	( clear b2 )
	( ontable b89 )
	( clear b89 )
	( ontable b30 )
	( clear b30 )
	( ontable b39 )
	( clear b39 )
	( ontable b87 )
	( clear b87 )
	( ontable b83 )
	( clear b83 )
	( ontable b6 )
	( clear b6 )
	( ontable b26 )
	( clear b26 )
	( ontable b64 )
	( clear b64 )
	( ontable b56 )
	( clear b56 )
	( ontable b93 )
	( clear b93 )
	( ontable b17 )
	( clear b17 )
	( ontable b5 )
	( clear b5 )
	( ontable b88 )
	( clear b88 )
	( ontable b23 )
	( clear b23 )
	( ontable b70 )
	( clear b70 )
	( ontable b62 )
	( clear b62 )
	( ontable b28 )
	( clear b28 )
	( ontable b57 )
	( clear b57 )
	( ontable b42 )
	( clear b42 )
	( ontable b96 )
	( clear b96 ) )
  (:goal
	( and 
	( ontable b83 )
	( on b76 b83 )
	( on b87 b76 )
	( on b38 b87 )
	( on b13 b38 )
	( on b48 b13 )
	( on b72 b48 )
	( on b7 b72 )
	( on b3 b7 )
	( on b31 b3 )
	( on b81 b31 )
	( on b77 b81 )
	( on b5 b77 )
	( on b32 b5 )
	( on b12 b32 )
	( on b44 b12 )
	( on b51 b44 )
	( on b35 b51 )
	( on b23 b35 )
	( on b93 b23 )
	( on b97 b93 )
	( on b9 b97 )
	( on b29 b9 )
	( on b16 b29 )
	( on b53 b16 )
	( on b64 b53 )
	( clear b64 )
	( ontable b11 )
	( on b19 b11 )
	( on b98 b19 )
	( on b25 b98 )
	( on b20 b25 )
	( on b47 b20 )
	( on b58 b47 )
	( on b70 b58 )
	( on b30 b70 )
	( on b89 b30 )
	( on b69 b89 )
	( on b14 b69 )
	( on b54 b14 )
	( on b6 b54 )
	( clear b6 )
	( ontable b50 )
	( on b10 b50 )
	( on b26 b10 )
	( clear b26 )
	( ontable b91 )
	( on b96 b91 )
	( on b67 b96 )
	( on b88 b67 )
	( on b84 b88 )
	( on b36 b84 )
	( on b46 b36 )
	( on b45 b46 )
	( on b79 b45 )
	( on b100 b79 )
	( on b52 b100 )
	( on b24 b52 )
	( on b95 b24 )
	( on b57 b95 )
	( on b90 b57 )
	( on b94 b90 )
	( on b66 b94 )
	( on b71 b66 )
	( on b18 b71 )
	( on b21 b18 )
	( on b17 b21 )
	( on b1 b17 )
	( on b49 b1 )
	( on b85 b49 )
	( on b73 b85 )
	( on b55 b73 )
	( on b86 b55 )
	( on b27 b86 )
	( on b37 b27 )
	( on b2 b37 )
	( clear b2 )
	( ontable b68 )
	( on b75 b68 )
	( on b43 b75 )
	( on b40 b43 )
	( on b65 b40 )
	( on b74 b65 )
	( on b8 b74 )
	( on b33 b8 )
	( clear b33 )
	( ontable b80 )
	( on b4 b80 )
	( clear b4 )
	( ontable b34 )
	( on b92 b34 )
	( clear b92 )
	( ontable b82 )
	( clear b82 )
	( ontable b28 )
	( clear b28 )
	( ontable b78 )
	( clear b78 )
	( ontable b41 )
	( clear b41 )
	( ontable b99 )
	( clear b99 )
	( ontable b56 )
	( clear b56 )
	( ontable b62 )
	( clear b62 )
	( ontable b22 )
	( clear b22 )
	( ontable b59 )
	( clear b59 )
	( ontable b15 )
	( clear b15 )
	( ontable b63 )
	( clear b63 )
	( ontable b42 )
	( clear b42 )
	( ontable b60 )
	( clear b60 )
	( ontable b61 )
	( clear b61 )
	( ontable b39 )
	( clear b39 )
	)
  )
)