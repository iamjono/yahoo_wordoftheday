[
/* =======================================================
Requires xml_tree
======================================================= */
define yahoo_wordoftheday => thread {
	data
		public date::date,
		public word::string,
		public definition::string,
		public link::string
	/* =====================================================================================
		onCreate Method is not really used here. 
		Initially included and used for testing.
	===================================================================================== */	
	public onCreate() => {
		//.populate()
	}
	/* =====================================================================================
		Populate method reaches out and gets the data
	===================================================================================== */	
	public populate() => {
		local(data = xml_tree(include_url('http://xml.education.yahoo.com/rss/wotd/')->asString))
		
		// assign data to thread object data members
		.word = #data->channel->item->title->contents->split(' - ')->first
		.definition = #data->channel->item->description->contents
		.link = 'http://education.yahoo.com/reference/dictionary/entry/'+.word
		.date = date_gmttolocal(date(#data->channel->item->pubDate->contents, -format='%a, %d %b %Y %H:%M:%S GMT'))
	
	}
	/* =====================================================================================
		The active_tick method fires on a pre-determined interval to refresh content
	===================================================================================== */	
	public active_tick() => {
		// trigger refresh of content
		.populate()
		
		// run once per day (every 86400 seconds)
		return 86400
	}
	
}


]
