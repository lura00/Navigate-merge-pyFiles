# Tar in input från användare och räknar ut värdet
# echo "Please feed me with two numbers"
# read number1
# read number2
# echo "The sum of your two numbers is: "$(expr $number1 + $number2)""
#!/usr/bin/bash
while true; do
    STRING = '.py'
    pushd "$python_dir" > /dev/null
    echo "Here is your working directory: $PWD"
    echo ""
    let count=0
    for file in *
    do
        if [ -f $file ]; then
            echo "This is files: $file"
            let count=count+1
        elif [ -d $file ]; then
            echo "This is directories: $file"
            let count=count+1
        fi
        if file --mime-type "$file" | grep .*.py; then
            echo "This is python files!"
            echo "Would you like to merge?"
            read choice
            if [[ $choice == 'yes' ]]; then
                touch output.py
                cat *.py > output.py
            else
            echo "Continue"
            fi
        fi
    done
    echo ""
    echo "Count: $count"

    # Hittar in i val av mapp och sedan mergear .py-filer till en fil.py.

    echo "What folder would you like to go ahead and open or type q to quit?"
    read folder
    if [[ $folder == 'q' ]]; then
        echo "You are now leaving this program!"
        break
    fi
    python_dir=$PWD/${folder}
    cd ${python_dir}
done