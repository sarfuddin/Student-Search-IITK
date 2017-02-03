
superEmail() {
    echo "Please Input the Email-ID:"
    read email
    touch "${scriptPath}/temp/tempStor"
    while read line
    do
        year="${line:0:2}"
        if [ "$line" -eq "$line" ] 2>/dev/null; then
            :
        else
            echo "error: Not a Number" >> "temp/tempStor"
            continue
        fi
        cd "${scriptPath}/data/Students"
            cd "Y${year}"
                cd "${line}"
                    EID=`cat EmailID`
                    if [[ "${EID,,}" = "${email,,}"* ]]; then
                        echo "${line}" >> "../../../../temp/tempStor"
                    fi
                cd ..
            cd ..
        cd ../..
    done < "temp/$1"
    cp "temp/tempStor" "temp/$1"
    rm "temp/tempStor"
    PS3="Pick an Option(Enter 9 or Ctrl-C to exit the search): "
    cd "${PWD}"
    return
}
