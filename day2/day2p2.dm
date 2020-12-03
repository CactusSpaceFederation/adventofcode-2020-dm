mob/proc/Day2p2()
	var/inputText = "[file2text('input.txt')]"
	var/regex/inputRegex = new/regex("^(\\d+)-(\\d+) (.):(.+)$", "gm")
	var/v = 0
	for(var/i=1, i<PASSAMT, i++)
		inputRegex.Find(inputText)
		var/min = text2num("[inputRegex.group[1]]")
		world << "min: [min]"
		var/max = text2num("[inputRegex.group[2]]")
		world << "max: [max]"
		var/char = "[inputRegex.group[3]]"
		world << "char: [char]"
		var/pass = "[inputRegex.group[4]]"
		world << "pass: [pass]"
		var/regex/passFilter = new/regex("([char])", "g")
		var/indexMatch = 0
		while(passFilter.Find(pass))
			var/charIndex = (passFilter.index)
			if((charIndex == min) || (charIndex == max))
				indexMatch++
		if(indexMatch == 1)
			v++
			world << "VALID"
	world << "Valid Passwords: [v]"
