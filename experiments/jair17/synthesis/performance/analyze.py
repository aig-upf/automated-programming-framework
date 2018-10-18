#execute first: grep -r -e Done -e "s\]"
from sets import Set
domains=["gripper", "blocks", "list", "summatory", "reverse"]
names=["Gripper", "Blocks", "List", "Triangular Sum", "Reverse" ]
maxi=5*[0]
mini=5*[1000000]
avg=5*[0]
maxid=[ 2, 120, 720, 24, 2]
total=5*[0]
instances=[2,5,6,4,2]
visited=Set([])
with open("analysis.txt") as f:
	for l in f:
		words=l.split()
		if( not ("BFWS" in l) ):
			continue
		d=-1
		for i in range(0,len(domains)):
			if domains[ i ] in l:
				d = i
				break
		if(words[0] in visited):
			continue
		visited.add( words[0] )
		searchtime=float( words[ 4 ] )
		print( searchtime )
		#searchtime=float(words[4][3:-2])
		maxi[d] = max( maxi[d], searchtime )
		mini[d] = min( mini[d], searchtime )
		avg[d] = avg[d] + searchtime
		total[d]=total[d]+1

print("\\begin{table}[hbt!]\n\\begin{scriptsize}\n\\centering\n\\begin{tabular}{l | r | r | r | r | r }\n\\textbf{Domain}&\\textbf{Instances}&\\textbf{Experiments}&\\textbf{Min. search(s)}&\\textbf{Max. search(s)}&\\textbf{Avg. time(s)}\\\\\\hline\n")
for i in range( 0, 5 ):
	avg[i]=avg[i]/total[i]
	#print( "Domain: " + domains[ i ] + " Maxi: "+ str( maxi[ i ] ) + " Mini: " + str( mini[ i ] ) + " Avg: " + str( avg[ i ] ) )
	print( names[ i ] + " & " + str( instances[ i ] ) + " & " + str( maxid[ i ] ) + " & " + str( mini[ i ] ) + " & " + str( maxi[ i ] ) + " & %.2f\\\\"%avg[ i ])
	
print("\\end{tabular}\n\\caption{\\small Number of instances, number of experiments that are factorial in the number of instances, and minimum, maximum and average times in seconds in the experiments set.}\n\\label{tab:performance}\n\\end{scriptsize}\n\\end{table}")
