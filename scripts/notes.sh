#!/usr/bin/env bash

if [ -h $1 ]
then
	echo "Use: notes.sh -c -l -p -m -i -x"
	echo "-c	Information on checks (skill or otherwise). Contains Skill, Attack, Save, Contested, Bonuses, Difficulty, making skill checks."
	echo "-l	Information on License Levels. Contains LL0 (starting) stats and Leveling stat increases."
	echo "-p 	Statistical combat relevant information on Pilots. Contains Size, HP, Evasion, E-Defense, Speed, Armor, Weapons and Gear."
	echo "-m 	Information on Mechs. Contains Statistics, Mech Skills (HP, Repair Cap, Speed, Evasion, Sensors, Tech Attack, E-Defense, Heat Cap, Save Target, Limited), Frame (Size, Armor, Mounts, System Points, Core System), Weapon (Size, Type, Damage)."
	echo "-i 	Information on missions. Contains Briefing, Preparation, Reserves, Boots on the Ground, Debriefing."
	echo "-x 	Information on pilot damage. Contains Minor, Major, Lethal and Down & Out."
fi

while getopts hclpmixs: option
do
	case "${option}" in
		c) CHECKS="C";;
		l) LICENSE="L";;
		p) PILOTS="P";;
		m) MECHS="M";;
		i) MISSIONS="I";;
		x) DAMAGE="X";;
	esac
done

if [ $CHECKS ]
then
	echo "Checks
	Skill
		dice	d20
		pass	10
		fail	9
		GM	Difficult, Risky
	Attack
		dice	d20
		pass	—
		fail	—
		crit	>20
	Save
		dice	d20
		pass	—
		fail	—
	Contest
		skill check
		pass	highest
		fail	lowest
		tie		initiator wins
	Bonuses	
		Stats	1 p/roll (triggers, mech skills, Grit)
		Accuracy	1d6 (per point) multi bonus dice = highest number
		Diff	1d6 (per point) multi bonus dice = highest number
		Grit	1/2 LL
	Difficulty
		Normal
		Difficult
			+1 to Difficulty
		Risky
			<20 always has consequences
		Heroic
			success >=20
		Impossible
			no roll is good enough
	making skill checks
		1. name goal
		2. GM decides difficulty & consequences of failure. No consequences = success
		3. determine which triggers activate
		4. roll 1d20 + relevant modifiers; >=10 is a success, <=9 is a failure
		5. push it, if relevant
		pushing it
			Not Risky	situation becomes Risky
			Risky	cannot be pushed, unless GM allows
			Heroic	cannot be pushed
		consequences
			harm
			time
			resources
			collateral
			position
			effectiveness"
fi

if [ $LICENSE ]
then
	echo "License Levels
	LL0
		Background
		4 +2 triggers
		1 +2 mech skills or 2 +1 mech skills
		3 rank 1 talents
		GMS gear and weapons
		Frame GMS-SP1 Everest
	Leveling
		+2 to trigger or new trigger at +2
		+1 to one mech skill
		+1 talent rank (new or improve)
		+1 License rank (talents & licenses)
		LL 3, 6, 9, 12 give new core bonus
		Choose one
			Reallocate all ranks from one talent to another
			Reallocate all ranks from one license to another
			Replace one core bonus with another legal core bonus"
fi

if [ $PILOTS ]
then
	echo "Pilots (combat)
	Statistics
		Size	1/2 (tiles)
		HP		6 + Grit
		Evasion	10
		E-Defense	10
		Speed	4
		Armor	one piece
		weap	<= 2
		gear	<= 3"
fi

if [ $MECHS ]
then
	echo "Mechs
	Statistics
		HP		2/1 Hull + Grit
		repCap	1/2 Hull
		Speed	1/2 Agility
		Evasion Agility
		sensors	
		techAtk	Systems
		E-def 	Systems
		heatCap	Engineering
		saveTgt	+ Grit
		Limited	1/2 Engineering
	mech skills
		Hull	strength, resist
		Agi	evasion, acrobatics
		Sys	hacking, analysis, boosting (electronic)
		Eng	optimizing, efficiency, going over breaking point
	Frame
		Size	1/2-3 tiles
		Armor	<= 4
		Mounts
			main	one main or auxiliary
			heavy	one heavy, main or auxiliary
			aux/aux	two auxiliary
			main/aux	one main and one aux or two auxiliary
			flexible	one main or two auxiliary
			integratd	cannot be removed, destroyed, replaced or modified
			superheavy	need both one heavy and another mount
		System Points	1/2 systems + Grit
		Core System	CP = 1, regained on mission start or Full Repair
	Weapon
		Size
			auxiliary
			main
			heavy
			superheavy
		Type
			melee
			ranged
				CQB
				rifles
				launchers
				cannons
				nexus
		Damage
			kinetic
			explosive
			energy
			special (harm)
				heat
				burn"
fi

if [ $MISSIONS ]
then
	echo "Missions
	Briefing
		situation
		goal
		stakes
	Preparation
	Reserves
	Boots on the ground
	Debriefing
		leveling
		chit-chat"
fi

if [ $DAMAGE ]
then
	echo "Damage (pilot)
	minor	1-2
	major	3-5
	lethal	>6
	down & out
		1d6
			6	returns to 1HP
			2-5	pilot is Down & Out and Stunned at 0HP. If in mech, they're Stunned and Evasion =5
			1	pilot dies"
fi