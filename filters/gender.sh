
gender() {
    PS3="Please choose the required gender:"
    genders=("M" "F")
    gender=""
    select gen in "${genders[@]}"
    do
        case "${gen}" in
            "F")
                 ;;
            "M")
                 ;;
            *)
                echo "No such gender exists"
                PS3="Pick an Option(Enter 9 or Ctrl-C to exit the search): "
                cd "${PWD}"
                return ;;
        esac
        gender="${gen}"
        touch "${scriptPath}/temp/gender"
        cd "${scriptPath}/data/Students"
            for year in `seq 11 16`
            do
                cd "Y${year}"
                    for dir in `ls`
                    do
                        cd "${dir}"
                            gen=`cat Gender`
                            if [ "${gen}" = "${gender}" ]; then
                                echo "${dir}" >> "../../../../temp/gender"
                            fi
                        cd ..
                    done
                cd ..
            done
        cd ../..
        break
    done
    if [ ! -s "temp/gender" ]; then
        echo "No such gender exists"
        rm temp/gender
        cd "${PWD}"
        return
    fi
    while [ 1 -lt 2  ]
    do
        echo "Do you want to see the result(R) or add further filters(F)?[R/F](Ctrl-C to exit)"
        read ans
        if [ "${ans}" = "r"  ] || [ "${ans}" = "R"   ]; then
            rollnoVAR "gender"           
            echo "Do you want to add further filters?(y/n)"
            read ans
            if [ "${ans}" = "n"  ] || [ "${ans}" = "N"  ];then
                break
            fi
            ans="F"
        fi
        if [ "${ans}" = "f"  ] || [ "${ans}" = "R"  ];then
            superFilter "gender"
        fi
    done
    rm "temp/gender"
    PS3="Pick an Option(Enter 9 or Ctrl-C to exit the search): "
    cd "${PWD}"
}
