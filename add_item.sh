# associatve arrays in bash > 4.2

declare -A sum inv

# build array with the sum of all item counts
while read pre type item cnt
do
	(( sum[$type/$item] += cnt ))
done <$1

[ $# -eq 2 ] &&
while read pre type item cnt
do
	(( sum[$type/$item] -= cnt ))
done <$2

for i in ${!sum[@]}	# all items
do
	echo ${i/\// } ${sum[$i]} 	# replace / with space
done | sort
