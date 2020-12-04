/* for reference
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
*/

var/global/list/validPassportsPart2 = list()

mob/verb/validatepart2()
	for(var/obj/passport/P in validPassports)
		P.byr = text2num(P.byr)
		switch(P.byr)
			if(1920 to 2002)
			else
				world << "[P] removed for invalid byr ([P.byr])"
				validPassports.Remove(P)
				continue

		P.iyr = text2num(P.iyr)
		switch(P.iyr)
			if(2010 to 2020)
			else
				world << "[P] removed for invalid iyr ([P.iyr])"
				validPassports.Remove(P)
				continue

		P.eyr = text2num(P.eyr)
		switch(P.eyr)
			if(2020 to 2030)
			else
				world << "[P] removed for invalid eyr ([P.eyr])"
				validPassports.Remove(P)
				continue

		//height
		var/regex/hgtR = new/regex(@"^(\d{2,3})(\l{2})$")
		if(hgtR.Find(P.hgt))
			var/height = text2num(hgtR.group[1])
			var/unit = hgtR.group[2]
			switch(unit)
				if("in")
					height = round(height*2.54)
				if("cm")
				else
					world << "[P] removed for invalid height unit ([unit])"
					validPassports.Remove(P)
					continue
			switch(height)
				if(150 to 193)
				else
					world << "[P] removed for invalid height ([height])"
					validPassports.Remove(P)
					continue
		else
			world << "[P] removed for invalid height structure ([P.hgt])"
			validPassports.Remove(P)
			continue
		/*
		var/heightUnit
		if(findtext(P.hgt,"cm"))
			heightUnit = "cm"
		else if(findtext(P.hgt,"in"))
			heightUnit = "in"
		if(!heightUnit)
			world << "[P] removed for invalid height unit ([heightUnit])"
			validPassports.Remove(P)
			continue
		else
			var/regex/R = new/regex(@"^(\d{2,3})\l{2}$")
			if(R.Find(P.hgt))
				var/height = text2num(R.group[1])
				var/heightvalid = 0
				switch(heightUnit)
					if("cm")
						switch(height)
							if(150 to 193)
								heightvalid = 1

					if("cm")
						switch(height)
							if(59 to 76)
								heightvalid = 1
				if(!heightvalid)
					world << "[P] removed for invalid height amount ([height])"
					validPassports.Remove(P)
					continue
			else
				world << "[P] removed for height not found ([P.hgt])"
				validPassports.Remove(P)
				continue
		*/
		//hair color
		var/regex/hclR = new/regex(@"^#(\w{6})$")
		if(!hclR.Find(P.hcl))
			world << "[P] removed for invalid hair color ([P.hcl])"
			validPassports.Remove(P)
			continue
		//eye color
		if(!findtext(P.ecl, regex(@"^amb$|^blu$|^brn$|^gry$|^grn$|^hzl$|^oth$")))
			world << "[P] removed for invalid eye color ([P.ecl])"
			validPassports.Remove(P)
			continue
		var/regex/pidR = new/regex(@"^\d{9}$")
		if(!pidR.Find(P.pid))
			world << "[P] removed for invalid pid ([P.pid])"
			validPassports.Remove(P)
			continue
		world << "[P] is valid"
	world << "Part 2 valid passports: [validPassports.len]"
