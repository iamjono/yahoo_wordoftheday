[
	sys_listTypes !>> 'xml_tree' ? include('xml_tree.lasso')
	sys_listTypes !>> 'yahoo_wordoftheday' ? include('yahoo_wordoftheday.lasso')

	'Word of the Day: <a href="'
		yahoo_wordoftheday->link
	'" target="_blank">'
		yahoo_wordoftheday->word
	'</a> - '
		yahoo_wordoftheday->definition
]