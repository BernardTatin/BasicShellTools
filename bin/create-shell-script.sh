#!/bin/sh

script=$(basename $0)

dohelp() {
    exit_code=0
    [ $# -ne 0 ] && exit_code=$1

    cat <<DOHELP
$script [-h|--help] : this text
$script script script ... : create all shell scripts
DOHELP
    exit $exit_code
}

create_script() {
    new_script=$1
    cat > $new_script <<CREATESCRIPT
#!/bin/sh

script=\$(basename \$0)

dohelp() {
    exit_code=0
    [ $# -ne 0 ] && exit_code=\$1

    cat <<DOHELP
\$script [-h|--help] : this text
\$script script script ... : create all shell scripts
DOHELP
    exit \$exit_code
}

[ \$# -eq 0 ] && dohelp
case \$1 in
    -h|--help)
        dohelp
        ;;
esac

while [ \$# -ne 0 ]
do
    echo \$1
    shift
done

CREATESCRIPT
    chmod +x $new_script
}

[ $# -eq 0 ] && dohelp
case $1 in
    -h|--help)
        dohelp
        ;;
esac

while [ $# -ne 0 ]
do
    create_script $1
    shift    
done
