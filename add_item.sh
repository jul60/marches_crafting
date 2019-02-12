# associatve arrays in bash > 4.2

declare -A sum inv

# build array with the sum of all item counts from stdin
while read pre type item cnt
do
	(( sum[$type/$item] += cnt ))
done

[ $# -eq 1 ] &&
while read pre type item cnt
do
	(( sum[$type/$item] > 0 )) &&
		(( sum[$type/$item] -= cnt ))
done <$1

for i in ${!sum[@]}	# all items
do
	echo ${i/\// } ${sum[$i]} 	# replace / with space
done | sort
