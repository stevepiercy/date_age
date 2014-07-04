[
define_tag('age', -description='Returns age in years.  By default the current date is used to determine age, but can be overridden by passing in a second date.',
    -namespace='date_',
    -required='dob', -type='date',
    -optional='end', -type='date',
    -priority='replace');
    !local_defined('end') ? local('end') = date;
    local('age') = #end->year - #dob->year - 1;
    if((#end->month - #dob->month == 0 && #end->day - #dob->day >= 0)
        || #end->month - #dob->month > 0);
        #age+=1;
    /if;
    return(#age);
/define_tag;
]
