[ $# -ne 1 ] &&
{
	echo "usage: $0 <file>"
	exit 1
}

[ ! -s $1 ] &&
{
	echo "unknown item: $type/$item"
	exit 3
}

type=$(dirname $1)
item=$(basename $1 .txt)

print_items() {

    while read count file
    do  
        type=$(cut -f1 -d/ <<< $file)
        item=$(cut -f2 -d/ <<< $file)

		(( count *= $3 ))

		[[ -s $type/$item.txt ]] &&
		{
			echo $2 $type $item $count
			print_items $type/$item.txt $2"=" $count
		} ||
		{
			[ $type = common ] &&
				echo ${2//=/+} base $item $count ||
				echo $file not found
		}
    done < $1
}
echo "*" $type $item 1
print_items $type/$item.txt "=" 1
