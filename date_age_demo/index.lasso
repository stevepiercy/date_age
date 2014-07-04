[
// Either load the file date_age.lasso during server or site startup,
// in server or site library, or include it.  Choose one method.
// I recommend site startup.
// include('date_age.lasso'); // optional loading method
]<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>date_age by Steve Piercy</title>
    <link rel="stylesheet" type="text/css" media="screen" href="jquery.datepick.css" />
</head>
<body>
    <h1>date_age by Steve Piercy</h1>
    <p>Find the age by entering a birthdate. Optionally enter a date of death to determine the age at death.</p>
    <form method="post" action="[response_filepath]">
        <label>Birthdate</label><input type="text" id="dob" name="dob" size="12" maxlength="10" value="[action_param('dob')]" placeholder="yyyy-mm-dd"><br />
        <label>Date of death</label><input type="text" id="end" name="end" size="12" maxlength="10" value="[action_param('end')]" placeholder="yyyy-mm-dd"><br />
        <input type="submit" name="submit" value="Get Age" class="button" />
    </form>
[
// validate inputs
local('errors') = array;
if(action_param('submit') != '');
    // validate inputs
    if(action_param('submit') != 'Get Age');
        #errors->insert('You must click the "Get Age" button.');
    /if;

    if(string_findregexp(action_param('dob'), -find='^\\d{4}-\\d{2}-\\d{2}$')->size!=1);
        #errors->insert('Birthdate must be in the format yyyy-mm-dd.');
    else(!valid_date(action_param('dob'),-format='%Q'));
        #errors->insert('Birthdate not a valid date.');
    /if;

    if(action_param('end') != '');
        if(string_findregexp(action_param('end'), -find='^\\d{4}-\\d{2}-\\d{2}$')->size!=1);
            #errors->insert('Date of death must be in the format yyyy-mm-dd.');
        else(!valid_date(action_param('end'),-format='%Q'));
            #errors->insert('Date of death not a valid date.');
        else(action_param('end') <= action_param('dob'));
            #errors->insert('Date of death must be after Birthdate.');
        /if;
    /if;

    if(#errors->size == 0);
        // inputs are valid
        // let's find the age
        '<h2>'+date_age(date(action_param('dob')), date(action_param('end')))+'</h2>';
    else;
        '<p style="color:red; font-weight:bold;">';
        #errors->join('<br />');
        '</p>';
    /if;
/if;
]
<p>
<a href="http://www.stevepiercy.com/date_age-lasso-8-custom-tag-returns-age-in-years.html">Read the article date_age</a>.
</p>
<p>
<a href="http://keith-wood.name/datepick.html">Datepick jQuery plugin</a>
</p>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="jquery.plugin.js"></script>
<script type="text/javascript" src="jquery.datepick.js"></script>
<script>
$(function() {
    $('#dob').datepick({dateFormat: 'yyyy-mm-dd'});
    $('#end').datepick({dateFormat: 'yyyy-mm-dd'});
});
</script>
</body>
</html>
