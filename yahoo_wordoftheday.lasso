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
	public onCreate() => {
		//.populate()
	}
	public populate() => {
		local(data = xml_tree(include_url('http://xml.education.yahoo.com/rss/wotd/')->asString))
		 
		.word = #data->channel->item->title->contents->split(' - ')->first
		.definition = #data->channel->item->description->contents
		.link = 'http://education.yahoo.com/reference/dictionary/entry/'+.word
		.date = date_gmttolocal(date(#data->channel->item->pubDate->contents, -format='%a, %d %b %Y %H:%M:%S GMT'))
	
	}
	
	public active_tick() => {
		.populate()
		return 86400 // once per day
	}
	
}


]