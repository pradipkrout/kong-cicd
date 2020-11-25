#!/bin/sh -l
set -e -o pipefail

main (){
    cmd=$1
    dir=$2
    ops=$3
    opsvalue=$4
	env=$5
    if [ ! -e ${dir} ]; then
        echo "${dir}: No such file or directoy exists";
        exit 1;
    fi

    for file in $(ls ${dir}); do
		case $env in
			"test") echo "Executing: deck $cmd --$ops $opsvalue -s $dir/$file"; deck $cmd --$ops $opsvalue -s $dir/$file;;
			"master") echo "Executing: deck $cmd --$ops $opsvalue -s $dir/$file"; deck $cmd --$ops $opsvalue -s $dir/$file;;
			* ) echo "No files exist" && exit 1 ;;
		esac        
    done
}


case $1 in
    "ping") deck $1 --$3 $4;;
    "validate"|"diff"|"sync") main $1 $2 "$3" "$4" "$5";;
    * ) echo "deck $1 is not supported." && exit 1 ;;
esac
