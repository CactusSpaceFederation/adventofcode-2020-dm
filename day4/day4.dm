world/New()
	new mob
var/global/passportID = 1
var/global/inputText = file2text('input.txt')
var/global/list/passports = list()
var/global/list/validPassports = list()
var/global/list/invalidPassports = list()
var/global/list/ppentries = list("byr","iyr","eyr","hgt","hcl","ecl","pid","cid")

mob/Login()
	//split the text into chunks and add them to new passport objects inside this mob
	//for each passport object, regex the chunk of text and find the vars inside
	var/list/ppchunks = splittext(inputText, regex(@"$\b^", "gm"),1,0,0)
	for(var/chunk in ppchunks)
		var/obj/passport/P = new
		P.ppid = passportID
		P.name = "[P.name] #[passportID]"
		passportID++
		world << "Passport ID: [P.ppid]"
		world << "[chunk]"
		P.rawtext = chunk
		passports += P
	for(var/obj/passport/PP in passports)
		for(var/entry in ppentries)
			var/regex/R = regex("[entry]:(\\S+)", "gm")
			if(R.Find(PP.rawtext))
				PP.vars[entry] = R.group[1] //Very handy
		if(PP.byr && PP.iyr && PP.eyr && PP.hgt && PP.hcl && PP.ecl && PP.pid)
			validPassports |= PP //Add valid passports to a list for later.
		else
			invalidPassports |= PP
	world << "finished passport generation"
	src.showresults()

obj/passport
	name = "passport"
	desc = "This lets you travel around the world."
	var/ppid = "ERR"

	var/rawtext
	var/byr
	var/iyr
	var/eyr
	var/hgt
	var/hcl
	var/ecl
	var/pid
	var/cid

mob/verb/showresults()
	var/numofPP = passports.len
	world << "# of passports: [numofPP]"
	var/randppid = rand(1,numofPP)
	world << "Random passport selected: #[randppid]"
	var/obj/passport/P = passports[randppid]
	world << "rawtext: [P.rawtext]"
	world << "byr:[P.byr]"
	world << "iyr: [P.iyr]"
	world << "eyr: [P.eyr]"
	world << "hgt: [P.hgt]"
	world << "hcl: [P.hcl]"
	world << "ecl: [P.ecl]"
	world << "pid: [P.pid]"
	world << "cid: [P.cid]"
	world << "Total part 1 valid passports: [validPassports.len]"

	validatepart2()
