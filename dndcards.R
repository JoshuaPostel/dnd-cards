library(reshape2)
library(dplyr)



spells <- read.csv('C:\\Users\\Josh\\Desktop\\dndcards\\data\\5ESpells.csv', header = F)

CNames <- c('SpellName','Level','School','Ritual','CastingTime','Range','TargetArea','V','S','M','Component','Cost','Concentration','Duration','AttackSavingThrow','DAMType','DamageHeal','Book','PageName','AdditionalDetail','PerHigherLevel','Bard','Cleric','Druid','Paladin','Ranger','Sorceror','Warlock','Wizard')

names(spells) <- CNames


summary(as.factor(spells$Cleric))


#fix cleric caviot
spells$Cleric <- as.character(spells$Cleric)
laterSelection <- spells[,'Cleric'] == 'Cleric(Tempest)'

classes <- c('Bard','Cleric','Druid','Paladin','Ranger','Sorceror','Warlock')

for(class in classes){

spells[,class] <- as.character(spells[,class])
spot <- unlist(gregexpr('[(]',spells[grepl('[(]',spells[,class]),class])[1])+1
logical <- grepl('[(]',spells[,class])

spells[!logical,class] <- substr(spells[!logical,class],1,1)
spells[logical,class] <- paste0(substr(spells[logical,class],1,1), tolower(substr(spells[logical,class],spot,spot)))
}

spells[,'Wizard'] <- as.character(spells[,'Wizard'])
spells[spells[,'Wizard'] == 'Wizard','Wizard'] <- 'Z'

summary(as.factor(spells$Warlock))

#fixing warlock
selectionA <- spells[,'SpellName'] %in% c('Faerie Fire','Sleep','Calm Emotions','Blink','Plant Growth','Greater Invisibility','Seeming')
spells[selectionA,'Warlock'] <- 'Wa'

selectionF <- spells[,'SpellName'] %in% c('Burning Hands','Command','Blindness/Deafness','Scorching Ray','Fireball','Stinking Cloud','Fire Shield','Wall of Fire','Flame Strike','Hallow')
spells[selectionF,'Warlock'] <- 'Wf'

selectionO <- spells[,'SpellName'] %in% c('Dissonant Whispers',"Tasha's Hideous Laughter",'Detect Thoughts','Clairvoyance','Sending',"Evard's Black Tentacles",'Telekinesis')
spells[selectionO,'Warlock'] <- 'Wo'

selectionAO <- spells[,'SpellName'] %in% c('Phantasmal Force','Dominate Person','Dominate Beast')
spells[selectionAO,'Warlock'] <- 'Wao'

#fixing paly
selectionAV <- spells[,'SpellName'] %in% c('Misty Step','Protection from Energy')
spells[selectionAV,'Paladin'] <- 'Pav'
length(spells[selectionAV,'Paladin'])

selectionV <- spells[,'SpellName'] %in% c('Banishment')
spells[selectionV,'Paladin'] <- 'Pv'
length(spells[selectionV,'Paladin'])

selectionD <- spells[,'SpellName'] %in% c('Protection from Evil and Good','Sanctuary','Lesser Restoration','Zone of Truth','Dispel Magic')
spells[selectionD,'Paladin'] <- 'Pd'
length(spells[selectionD,'Paladin'])

summary(as.factor(spells$Paladin))

#fixing druid
selectionA <- spells[,'SpellName'] %in% c('Hold Person','Spike Growth','Sleet Storm','Slow','Freedom of Movement','Ice Storm','Commune with Nature','Cone of Cold')
spells[selectionA,'Druid'] <- 'Da'
length(spells[selectionA,'Druid'])

selectionC <- spells[,'SpellName'] %in% c('Mirror Image','Misty Step','Water Breathing','Water Walk','Control Water','Freedom of Movement','Conjure Elemental','Scrying')
spells[selectionC,'Druid'] <- 'Dc'
length(spells[selectionC,'Druid'])

selectionD <- spells[,'SpellName'] %in% c('Blur','Silence','Create Food and Water','Protection from Energy','Blight','Hallucinatory Terrain','Insect Plague','Wall of Stone')
spells[selectionD,'Druid'] <- 'Dd'
length(spells[selectionD,'Druid'])

selectionF <- spells[,'SpellName'] %in% c('Barkskin','Spider Climb','Call Lightning','Plant Growth','Divination','Freedom of Movement','Commune with Nature','Tree Stride')
spells[selectionF,'Druid'] <- 'Df'
length(spells[selectionF,'Druid'])

selectionG <- spells[,'SpellName'] %in% c('Invisibility','Pass without Trace','Daylight','Haste','Divination','Freedom of Movement','Dream','Insect Plague')
spells[selectionG,'Druid'] <- 'Dg'
length(spells[selectionG,'Druid'])

selectionM <- spells[,'SpellName'] %in% c('Spider Climb','Spike Growth','Lightning Bolt','Meld into Stone','Stone Shape','Stoneskin','Passwall','Wall of Stone')
spells[selectionM,'Druid'] <- 'Dn'
length(spells[selectionM,'Druid'])

selectionS <- spells[,'SpellName'] %in% c('Darkness',"Melf's Acid Arrow",'Water Walk','Stinking Cloud','Freedom of Movement','Locate Creature','Insect Plague','Scrying')
spells[selectionS,'Druid'] <- 'Ds'
length(spells[selectionS,'Druid'])

selectionU <- spells[,'SpellName'] %in% c('Spider Climb','Web','Gaseous Form','Stinking Cloud','Greater Invisibility','Stone Shape','Cloudkill','Insect Plague')
spells[selectionU,'Druid'] <- 'Du'
length(spells[selectionU,'Druid'])

selection <- spells[,'SpellName'] %in% c('Spike Growth')
spells[selection,'Druid'] <- 'Dan'
length(spells[selection,'Druid'])

selection <- spells[,'SpellName'] %in% c('Spider Climb')
spells[selection,'Druid'] <- 'Dfnu'
length(spells[selection,'Druid'])

selection <- spells[,'SpellName'] %in% c('Water Walk','Scrying')
spells[selection,'Druid'] <- 'Dcs'
length(spells[selection,'Druid'])

selection <- spells[,'SpellName'] %in% c('Stinking Cloud')
spells[selection,'Druid'] <- 'Dsu'
length(spells[selection,'Druid'])

selection <- spells[,'SpellName'] %in% c('Freedom of Movement')
spells[selection,'Druid'] <- 'Dacfgs'
length(spells[selection,'Druid'])

selection <- spells[,'SpellName'] %in% c('Divination')
spells[selection,'Druid'] <- 'Dfg'
length(spells[selection,'Druid'])

selection <- spells[,'SpellName'] %in% c('Commune with Nature')
spells[selection,'Druid'] <- 'Daf'
length(spells[selection,'Druid'])

selection <- spells[,'SpellName'] %in% c('Insect Plague')
spells[selection,'Druid'] <- 'Ddgsu'
length(spells[selection,'Druid'])

selection <- spells[,'SpellName'] %in% c('Wall of Stone')
spells[selection,'Druid'] <- 'Ddn'
length(spells[selection,'Druid'])


selection <- spells[,'SpellName'] %in% c('Stone Shape')
spells[selection,'Druid'] <- 'Dnu'
length(spells[selection,'Druid'])


#fixing clearic
spells$Cleric <- as.character(spells$Cleric)

selection <- spells[,'SpellName'] %in% c('Druidcraft','Poison Spray','Produce Flame','Shillelagh','Thorn Whip')
spells[selection,'Cleric'] <- 'C'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Command','Augury','Speak with Dead','Legend Lore','Scrying')
spells[selection,'Cleric'] <- 'Ck'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Bless','Cure Wounds','Lesser Restoration','Spiritual Weapon','Beacon of Hope','Revivify','Death Ward','Guardian of Faith','Mass Cure Wounds','Raise Dead')
spells[selection,'Cleric'] <- 'Cf'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Daylight','Guardian of Faith','Flame Strike','Scrying')
spells[selection,'Cleric'] <- 'Cl'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Insect Plague')
spells[selection,'Cleric'] <- 'Cn'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Control Water','Insect Plague')
spells[selection,'Cleric'] <- 'Cp'
length(spells[selection,'Cleric'])
spells[laterSelection,'Cleric'] <- 'Cp'

selection <- spells[,'SpellName'] %in% c('Dispel Magic')
spells[selection,'Cleric'] <- 'Ct'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Shield of Faith','Spiritual Weapon','Spirit Guardian','Freedom of Movement','Flame Strike')
spells[selection,'Cleric'] <- 'Cr'
length(spells[selection,'Cleric'])
spells[spells[,'Cleric'] == 'Cw','Cleric'] <- 'Cr'

selection <- spells[,'SpellName'] %in% c('Spiritual Weapon')
spells[selection,'Cleric'] <- 'Cfr'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Guardian of Faith')
spells[selection,'Cleric'] <- 'Cfl'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Insect Plague')
spells[selection,'Cleric'] <- 'Cnp'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Flame Strike')
spells[selection,'Cleric'] <- 'Clr'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Scrying')
spells[selection,'Cleric'] <- 'Ckl'
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Death Ward')
spells[selection,'Cleric'] <- 'Cdf'
length(spells[selection,'Cleric'])
selection <- spells[,'SpellName'] %in% c('Chill Touch')
spells[selection,'Cleric'] <- ''
length(spells[selection,'Cleric'])

selection <- spells[,'SpellName'] %in% c('Blindness/Deafness','Animate Dead')
spells[selection,'Cleric'] <- 'Cd'
length(spells[selection,'Cleric'])


summary(as.factor(spells$Cleric))
summary(as.factor(spells$Druid))
summary(as.factor(spells$Paladin))
summary(as.factor(spells$Warlock))


spells$Together <- paste0(spells$Cleric,spells$Druid,spells$Paladin)
spells$id <- 1:nrow(spells)

logical <- grepl('[a-z]',spells[,'Cleric'])
spells[logical,c('Level','SpellName','Cleric')]

logical <- grepl('[a-z]',spells[,'Druid'])
spells[logical,c('Level','SpellName','Druid')]

logical <- grepl('[a-z]',spells[,'Paladin'])
spells[logical,c('Level','SpellName','Paladin')]

logical <- grepl('[a-z]',spells[,'Warlock'])
spells[logical,c('Level','SpellName','Warlock')]

##spells complete


##begin formatting for LaTeX
texSpells <- spells



classes <- c('Cleric','Druid','Paladin','Warlock')
color <- c('white','orange','pink','purple')
texSpells$storage <- rep('',nrow(texSpells))


for(class in classes){

  for(letter in letters){
    
    logical <- grepl(letter, texSpells[,class])
    texSpells[logical,'storage'] <- paste0(texSpells[logical,'storage'],'\\rsc{',color[match(class,classes)],'}{',toupper(letter),'}')
  } 
  notEmpty <- texSpells[,'storage'] != ''
  texSpells[notEmpty,class] <- texSpells[notEmpty,'storage']
  texSpells[,'storage'] <- rep('',nrow(texSpells))
}

#W is too wide in current font
#texSpells$Cleric <- gsub('(\\{W\\})', '{R}', texSpells$Cleric)
#texSpells$Druid <- gsub('(\\{M\\})', '{N}', texSpells$Druid)
#texSpells$Druid <- gsub('(\\{-90\\}\\{\\\\subclass\\{orange\\}\\{M\\})', '{90}{\\\\subclass{orange}{V}', texSpells$Druid)




texSpells <- mutate(texSpells, Bard = ifelse(Bard == 'B', '\\class{yellow}', Bard))
texSpells <- mutate(texSpells, Cleric  = ifelse(Cleric == 'C', '\\class{white}', Cleric))
texSpells <- mutate(texSpells, Druid  = ifelse(Druid == 'D', '\\class{orange}', Druid))
texSpells <- mutate(texSpells, Paladin  = ifelse(Paladin == 'P', '\\class{pink}', Paladin))
texSpells <- mutate(texSpells, Ranger = ifelse(Ranger == 'R', '\\class{green}', Ranger))
texSpells <- mutate(texSpells, Sorceror  = ifelse(Sorceror == 'S', '\\class{red}', Sorceror))
texSpells <- mutate(texSpells, Warlock  = ifelse(Warlock == 'W', '\\class{purple}', Warlock))
texSpells <- mutate(texSpells, Wizard = ifelse(Wizard == 'Z', '\\class{blue}', Wizard))


for(i in (1:nrow(texSpells))){

  abrev <- NULL

  for(j in (22:29)){
    abrev <- paste0(abrev,texSpells[i,j])}
  
  texSpells[i,'Class'] <- abrev
    
}


temp <- melt(texSpells, id=c('SpellName','Level','School','Ritual','CastingTime','Range','TargetArea','V','S','M','Component','Cost','Concentration','Duration','AttackSavingThrow','DAMType','DamageHeal','Book','PageName','AdditionalDetail','PerHigherLevel'))

keepRows <- temp[,'value'] != ""

temp <- temp[keepRows,]

names(temp)[22] <- 'Class'
names(temp)[23] <- 'ClassDetail'

# cleanSpells <- temp[c('Class','SpellName','Level','School','ClassDetail','Ritual','CastingTime','Range','TargetArea','V','S','M','Component','Cost','Concentration','Duration','AttackSavingThrow','DAMType','DamageHeal','Book','PageName','AdditionalDetail','PerHigherLevel')]

cleanSpells <- texSpells[c('Class','SpellName','Level','School','Ritual','CastingTime','Range','TargetArea','V','S','M','Component','Cost','Concentration','Duration','AttackSavingThrow','DAMType','DamageHeal','Book','PageName','AdditionalDetail','PerHigherLevel')]

cleanSpells$id <- 1:nrow(cleanSpells)
cleanSpells$School <- substr(cleanSpells$School,1,3)
cleanSpells[is.na(cleanSpells$Ritual),'Ritual'] <- ""
cleanSpells[cleanSpells$Ritual != "",'Ritual'] <- '\\textit{(ritual)}'
cleanSpells$M <- as.character(cleanSpells$M)
cleanSpells[cleanSpells$M == 'M','M'] <- 'M '
cleanSpells <- mutate(cleanSpells, Cost = factor(ifelse(Cost == "", "", paste('-', as.character(Cost)))))
cleanSpells$Concentration <- as.character(cleanSpells$Concentration)
cleanSpells <- mutate(cleanSpells, Concentration = factor(ifelse(is.na(Concentration), '', '\\textit{(concentration)}')))
cleanSpells$PerHigherLevel <- as.character(cleanSpells$PerHigherLevel)
cleanSpells <- mutate(cleanSpells, PerHigherLevel = factor(ifelse(PerHigherLevel == '', '', paste('{\\textbf{Per Higher Lv:}}', as.character(PerHigherLevel)))))
cleanSpells$AttackSavingThrow <- as.character(cleanSpells$AttackSavingThrow)
cleanSpells <- mutate(cleanSpells, AttackSavingThrow = factor(ifelse(AttackSavingThrow == '', '', paste('{\\textbf{Saving Throw:}}', as.character(AttackSavingThrow)))))
cleanSpells$DamageHeal <- as.character(cleanSpells$DamageHeal)
cleanSpells$DamageHeal <- gsub('DAM:', '', cleanSpells$DamageHeal)
cleanSpells$DamageHeal <- gsub('HEAL:', '', cleanSpells$DamageHeal)
cleanSpells$DamageHeal <- gsub('See Details.', '', cleanSpells$DamageHeal)
cleanSpells$DamageHeal <- gsub('See Details', '', cleanSpells$DamageHeal)
cleanSpells <- mutate(cleanSpells, DamageHeal = factor(ifelse(DamageHeal == '', '', paste('{\\textbf{Roll:}}', as.character(DamageHeal)))))
cleanSpells$TargetArea <- as.character(cleanSpells$TargetArea)
cleanSpells <- mutate(cleanSpells, TargetArea = factor(ifelse(TargetArea == '', '', paste('{\\textbf{Target:}}', as.character(TargetArea)))))
cleanSpells$PerHigherLevel <- as.character(cleanSpells$PerHigherLevel)
cleanSpells$TargetArea <- gsub('<=', '$\\\\leq$', cleanSpells$TargetArea) 
cleanSpells$PerHigherLevel <- gsub('<=', '$\\\\leq$', cleanSpells$PerHigherLevel) 
cleanSpells$AdditionalDetail <- gsub('<=', '$\\\\leq$', cleanSpells$AdditionalDetail) 
cleanSpells$TargetArea <- gsub('>=', '$\\\\geq$', cleanSpells$TargetArea) 
cleanSpells$PerHigherLevel <- gsub('>=', '$\\\\geq$', cleanSpells$PerHigherLevel) 
cleanSpells$AdditionalDetail <- gsub('>=', '$\\\\geq$', cleanSpells$AdditionalDetail) 
cleanSpells$DAMType <- as.character(cleanSpells$DAMType)
cleanSpells$DAMType <- gsub('See Details', '', cleanSpells$DAMType)
cleanSpells$DAMType <- gsub('See Details.', '', cleanSpells$DAMType)
cleanSpells$AdditionalDetail <- gsub('&', '\\\\&', cleanSpells$AdditionalDetail)
cleanSpells$Component <- gsub('&', '\\\\&', cleanSpells$Component)

cleanSpells <- mutate(cleanSpells, DAMType = factor(ifelse(DAMType == '', '', paste('\\small \\textit ', as.character(DAMType)))))



cleanSpells[43,'AdditionalDetail'] <- 'Know location of aberration, celestial, elemental, fey, fiend, undead, (un)holy ground.'
cleanSpells$SpellName <- as.character(cleanSpells$SpellName)
cleanSpells[254,'DAMType'] <- ''
cleanSpells[293,'AdditionalDetail'] <- 'Cure: disease, poison. Immune: poison, fright. HP max +2d10,WIS save advantage.'

backup <- cleanSpells
cleanSpells <- backup

cleanSpells[grepl('(\\}\\{)', cleanSpells[,'Class']),'Class']

grepl('(\\}\\{)', cleanSpells[,'Class'])

subclassSpot <- unlist(gregexpr('(rsc\\{white\\})', cleanSpells[,'Class']))

clericSubclass <- unlist(grepl('(rotateSubclass\\{white\\})', cleanSpells[,'Class']))


clericChange <- c(33,38,42,79,94,97,121,144,149,192,151,162,163,186,190,208,209,216,220,258,259,260,265,268) #white
druidChange <- c(95,118,132,143,162,180,183,184,188,196,197,203,208,216,221,222,224,231,232,242,244,258,268,273,275) #orange
paladinChange <- c(73,121,148,163,202) #pink


for(n in clericChange){
  
  spot <- as.numeric(unlist(gregexpr('(\\\\rsc\\{white\\})', cleanSpells[n,'Class'])))

  cleanSpells[n,'Class'] <- gsub(paste0('^(.{',(spot-1),'})(.*)$'), '\\1\\\\class\\{white\\}\\2', cleanSpells[n,'Class'])
}

for(n in druidChange){
 
  spot <- as.numeric(unlist(gregexpr('(\\\\rsc\\{orange\\})', cleanSpells[n,'Class'])))

  cleanSpells[n,'Class'] <- gsub(paste0('^(.{',(spot-1),'})(.*)$'), '\\1\\\\class\\{orange\\}\\2', cleanSpells[n,'Class'])
}
 
for(n in paladinChange){
 
  spot <- as.numeric(unlist(gregexpr('(\\\\rsc\\{pink\\})', cleanSpells[n,'Class'])))

  cleanSpells[n,'Class'] <- gsub(paste0('^(.{',(spot-1),'})(.*)$'), '\\1\\\\class\\{pink\\}\\2', cleanSpells[n,'Class'])
}


#cleanSpells[258,'Class'] <- '\\class{white}\\rsc{white}{N}\\rsc{white}{P}\\class{orange}\\rsc{orange}{D}\\rsc{orange}{G}\\rsc{orange}{S}'

#\\class{white}\\rsc{white}{N}\\rsc{white}{P}\\class{orange}\\rsc{orange}{D}\\rsc{orange}{G}\\rsc{orange}{S}'

cleanSpells[258,'Class'] <- 'pasteHere'
#\class{white}\rsc{white}{N}\rsc{white}{P}\class{orange}\rsc{orange}{D}\rsc{orange}{G}\rsc{orange}{S}\rsc{orange}{U}\class{red}

test <- cleanSpells[1:180,]
test <- cleanSpells[181:361,]
test <- cleanSpells[1:361,]
test <- cleanSpells[1:9,]
write.csv(test, 'C:\\Users\\Josh\\Desktop\\dndcards\\dnd_gen-master\\test.csv', row.names = F)




  

  
  
