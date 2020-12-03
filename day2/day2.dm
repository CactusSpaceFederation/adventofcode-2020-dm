#define	PASSAMT 1001
#define TRUE 1
#define FALSE 0

world/New()
	new mob
mob/Login()
	..()
	Day2p2()

mob/verb/adventcode()
	Day2p2()

mob/proc/Day2()
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
		var/charLen = 0
		while(passFilter.Find(pass))
			charLen++
		if(charLen >= min && charLen <= max)
			v++
	world << "Valid Password: [v]"
