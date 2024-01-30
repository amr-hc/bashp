#!/bin/bash

echo "DataBase Connected $1" 

select choice in "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table"
do
    case $REPLY in
        1)
            	read -p "Enter table name: " table_name
            	if [ -e "$1/$table_name" ]; then
    			echo "Sorry there is table have same name"
		else
    			touch $1/$table_name
    			
    			read -p "What is the number of columns in the table : " columns_count
    			declare -a types
    			while [ $columns_count -gt 0 ];
    			do
    				#echo "$columns_count"
				read -p "column name $columns_count: " column_name
    				read -p "column type $columns_count: " column_type
    				
    				types[$columns_count]=$column_type	
    				if [ $columns_count -eq 1 ]; then
    					echo -n "$column_name" >> $1/$table_name
    				else
    					echo -n "$column_name:" >> $1/$table_name
    				fi
    				
    				((columns_count--))
    				
    			done
    			echo >> $1/$table_name
    			let i=${#types[@]}
    			echo $i
    			while [ $i -gt 0 ];
    			do
    				echo -n "${types[$i]}:" >> $1/$table_name
    				((i--))
			done

    			
    			
    			
    			echo "Table '$table_name' created."
		fi
            	
            	;;
        2)
            	echo "Listing All databases:"
            	ls -d */
            	;;
        3)
		read -p "Enter Database to connect: " dir_name
            	cd "$dir_name" || echo "Directory not found."
            	;;
        4)
		read -p "Enter database name: " dir_name
            	rm -r "$dir_name"
            	echo "Database '$dir_name' deleted."
           	;;
        5)
            	echo "Exiting the software."
            	exit 0
            	;;
        6)
            	echo "Exiting the software."
            	exit 0
            	;;
        7)
            	echo "Exiting the software."
            	exit 0
            	;;
        *)
            	echo "Invalid option. Please try tgain."
    esac
done
