Yahoo! Word Of The Day
======================

Lasso 9 API to Yahoo! Word Of The Day

Retrieves the Word of the Day from Yahoo! Education.

Stored as a thread object with data member properties: 

`word`, the `definition`, the publish `date`, and a permanent `link`. 

The thread object will refresh every 24 hours. 

Requires [xml_tree] (bundled in this repository).

Sample Usage
------------

```lasso
	sys_listTypes !>> 'xml_tree' ? include('xml_tree.lasso')
	sys_listunboundmethods !>> 'every' ? include('every.lasso')
	sys_listTypes !>> 'yahoo_wordoftheday' ? include('yahoo_wordoftheday.lasso')

	'Word of the Day: <a href="'
		yahoo_wordoftheday->link
	'" target="_blank">'
		yahoo_wordoftheday->word
	'</a> - '
		yahoo_wordoftheday->definition
```

Thanks!
-------
Thanks goes out to Jason Huck for creating the original Lasso 8 implementation.
