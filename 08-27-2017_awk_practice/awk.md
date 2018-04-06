## a number of awk basics

### regular expression must be enclosed in slashes (/.../)
If ! is append before the 1st slash, then all records not matching the regular expression will be chosen. 

* eg 

![eg1](https://github.com/leejimmy93/bioinfo_miscs/blob/master/08-27-2017/awk1.png)
### pattern-mathing expression 
Pattern matching expressions use the tilde operator (~). 

$n ~ /re/ Is true if the field $n matches the regular expression  re
$n !~ /re/ Is true if the field $n does not match the regular expression re

* eg 

![eg2](https://github.com/leejimmy93/bioinfo_miscs/blob/master/08-27-2017/awk2.png)
![eg3](https://github.com/leejimmy93/bioinfo_miscs/blob/master/08-27-2017/awk3.png)

### Relational number expressions
* eg 

]![eg4](https://github.com/leejimmy93/bioinfo_miscs/blob/master/08-27-2017/%20awk4.png)
 



 

 
