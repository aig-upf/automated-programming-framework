#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#

idx = 0
v = []

class Tree:
   def __init__(self, den):
      self.left = None
      self.right = None
      self.data = None
      self.density = den

   def fill( self ):
      global idx
      global v
      if ( idx < len( v ) ):
         if ( idx + 1 < len( v ) ):
            k = random.randint( 0, 2 )
            if ( k == 2 ) and ( random.randint( 0, self.density ) == 0 ) :
               self.right = Tree(self.density)
               self.right.data = v[ idx ]
               idx = idx + 1
               self.left = Tree(self.density)
               self.left.data = v[ idx ]
               idx = idx + 1
               self.right.fill( )
               self.left.fill( )
            elif ( k == 2 ) :
               self.right = Tree(self.density)
               self.right.data = v[ idx ]
               idx = idx + 1
               self.left = Tree(self.density)
               self.left.data = v[ idx ]
               idx = idx + 1
               self.right.fill( )
               self.left.fill( )
            elif ( k == 1 ) and ( random.randint( 0, self.density ) == 0 ):
               self.right = Tree(self.density)
               self.right.data = v[ idx ]
               idx = idx + 1
               self.right.fill( )
            elif ( k == 1 ):
               self.left = Tree(self.density)
               self.left.data = v[ idx ]
               idx = idx + 1
               self.left.fill( )
         else :
            k = random.randint( 0, 1 )
            if ( k == 1 ) and ( random.randint( 0, self.density ) == 0 ):
               self.right = Tree(self.density)
               self.right.data = v[ idx ]
               idx = idx + 1
               self.right.fill( )
            elif ( k == 1 ):
               self.left = Tree(self.density)
               self.left.data = v[ idx ]
               idx = idx + 1
               self.left.fill( )
   def printr( self ):
      s = ""
      if ( self.right != None ) or ( self.left != None ) :
         s = s + "\n\t( internal " + self.data + " )"
      if ( self.right != None ):
         s = s + "\n\t( right-child " + self.right.data + " " + self.data + " )"
         s = s + self.right.printr()
      if ( self.left != None ):
         s = s + "\n\t( left-child " + self.left.data + " " + self.data + " )"
         s = s + self.left.printr()
      return s
   def getNodes( self ):
      nodes = [ self.data ]
      if ( self.right != None ):
         nodes.extend( self.right.getNodes() )
      if ( self.left != None ):
         nodes.extend( self.left.getNodes() )
      return nodes
      

try:
   nodes = int( sys.argv[ 1 ] )
   lettername = sys.argv[ 2 ]
   density = int( sys.argv[ 3 ] )
except:
   print "Usage:"
   print sys.argv[ 0 ] + " <nodes> <letter> <density>"
   print sys.argv[ 0 ] + " 6 a 1"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM P"+ str( nodes ) + str( lettername ) + ")\n"
str_problem=str_problem + "  (:DOMAIN trees_alt )\n"
str_problem=str_problem + "  (:OBJECTS \n\t"

str_problem = str_problem + " current childs - variable\n\t"
for i in xrange( 1, nodes + 1 ):
   str_problem = str_problem + " n" + str( i )
str_problem = str_problem + " - node )\n\t"

str_problem = str_problem + "\n  (:INIT"

for i in xrange( 1, nodes + 1 ):
   v.append( ( "n" + str( i ) ) )
random.shuffle( v )

root = Tree( density )
root.data = v[ 0 ]
idx = 1
root.fill( )

str_problem = str_problem + "\n\t( assignment current " + v[ 0 ] + " )"

str_problem = str_problem + root.printr( )

str_problem = str_problem + " )"

str_problem = str_problem + "\n  (:GOAL\n\t( AND " 


for i in root.getNodes():
   str_problem = str_problem + "\n\t( visited " + i + " )"

str_problem = str_problem + "\n\t)\n  )\n)"

str_problem = str_problem.lower()

f_problem=open("p"+ str( nodes ) + str( lettername ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit( 0 )
