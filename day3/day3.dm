world/New()
	new mob
mob/verb/adventcode()
	day3p1()
mob/Login()
	day3p1()
mob/proc/day3p1()
	var/jump = 34
	var/trees = 0
	var/newlines = 0
	var/totaltiles = 0
	var/length = 10013
	var/inputText = "[file2text('input.txt')]"
	var/filtInputText
	inputText = (replacetext(inputText, regex(@"\b","gm"),"",1,0))
	var/list/inputList1 = list()
	var/regex/splitter = new/regex(@"(.+(\b)","gm")
	while(splitter.Find(inputText))
		inputList1 += splitter.group[1]
	for(var/strings in inputList1)
		filtInputText = "[filtInputText][strings]"
	world << filtInputText
	text2file(filtInputText,"filtered input.txt")
	var/list/inputList = list()
	var/regex/tiles = new/regex(@".", "gm")

	while(tiles.Find(filtInputText))
		var/matched = tiles.match
		switch(matched)
			if("#")
				inputList += matched
				totaltiles++
				if(((totaltiles) % jump) == 0)
					trees++
					inputList[totaltiles] = "X ([totaltiles])"
					world.log << "collided with tree at index [totaltiles]"

			if(".")
				inputList += matched
				totaltiles++
			else
				newlines++

	for(var/entry in inputList)
		if(entry != "." && entry != "#")
			world << "[entry]"
	world << "newlines: [newlines]"
	world << "tiles: [totaltiles]"
	world << "trees: [trees]"
