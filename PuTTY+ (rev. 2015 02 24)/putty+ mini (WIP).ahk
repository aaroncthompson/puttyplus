#NoEnv
SendMode Input

MainCourse:
Gui, Add, Text, Number, SKU:
Gui, Add, Text,, Description:
Gui, Add, Text,, AltDescription:
Gui, Add, Text,, Class:
Gui, Add, Text,, Manufacturer:
Gui, Add, Text,, Retail (XX.XX):
Gui, Add, Text,, Cost (XX.XX):
Gui, Add, Text,, Quantity:
Gui, Add, ComboBox, vSKU ym, Generate new
Gui, Add, Edit, vDescription
Gui, Add, Edit, vAltDescription
Gui, Add, DropDownList, vClass, 1/4 zip non-hood (683)|Baseball caps/hats (651)|Crews/sweaters (631)|Full zip non-hood (686)|Hoods (635)|Inf/Todd Pants/Bottm (675)|Infant Bibs (678)|Infant Blankets (677)|Infant Onesies (672)|Infant/Toddler (660)|Infant/Toddler Hoods (673)|Infant/Toddler Tops (671)|Infant/Toddler Zips (674)|Juniors tops (614)|Knit sweaters (682)|Logo Footwear (602)|Misc Emblematic (754)|Pants/shorts/boxers (640)|T-Shirts (621)|Women's pants/shorts (611)|Youth Hoods (668)|Youth T-Shirts (669)|Youth Zip Hoods (667)|Zip Hoods (632)
Gui, Add, DropDownList, vManufacturer, Adidas (46219)|American Apparel (AA)|Badger Sportswear (BADGER)|Champion (442)|College Kids (54914)|CT Beat (85042)|Cutter&Buck (8720)|Game (533)|Gear (65)|Jansport (35)|League (360)|Legacy (1938)|MV Sport (84)|MyU Apparel (32811)|RFSJ (RFSJ)|Russell (64)|Under Armour (14908)|Wide World (107)|Venley (VENLEY)
Gui, Add, Edit, vPrice
Gui, Add, Edit, vCost
Gui, Add, Edit, vQuantity
Gui, Add, Button, default gOK, OK
Gui, Add, Button, default gEND, End order
Gui, Show
return

OK: ; the button || CHANGE THIS TO CHECKING THE SCREEN
Gui, Submit, NoHide
if WinExist("128.200.235.235") {
    Gosub CheckSKU
} else {
	MsgBox Don't touch PuTTY! Start it all over.
}
return

CheckSKU:
If(strlen(SKU)<=0) 
    MsgBox You need a SKU!
 else {
	Gosub CheckDesc
}
return

CheckDesc:
If(strlen(Description)<=0)
	MsgBox You need a description!
 else {
	Gosub CheckAltDesc
}
return

CheckAltDesc:
If(strlen(AltDescription)<=0)
	MsgBox You need an alternate description!
 else {
	Gosub CheckClass
}
return

CheckClass:
If(strlen(Class)<=0)
	MsgBox You need a class!
 else {
	Gosub CheckMan
}
return

CheckMan:
If(strlen(Manufacturer)<=0)
	MsgBox You need a Manufacturer!
 else {
	Gosub CheckPrice
}
return

CheckPrice:
If(strlen(Price)<=0)
	MsgBox You need a retail price!
 else {
	Gosub CheckCost
}
return

CheckCost:
If(strlen(Cost)<=0)
	MsgBox You need a cost!
 else {
	Gosub CheckQty
}
return

CheckQty:
If(strlen(Quantity)<=0)
	MsgBox You need a quantity!
 else {
	Gosub Manuswitch
}
return

Manuswitch:
{
if Manufacturer = Adidas (46219) ; Need one for every manufacturer
	Manufacturer = 46219
if Manufacturer = American Apparel (AA)
	Manufacturer = AA
if Manufacturer = Badger Sportswear (BADGER)
	Manufacturer = BADGER
if Manufacturer = Champion (442)
	Manufacturer = 442
if Manufacturer = College Kids (54914)
	Manufacturer = 54914
if Manufacturer = CT Beat (85042)
	Manufacturer = 85042
if Manufacturer = Cutter&Buck (8720)
	Manufacturer = 8720
if Manufacturer = Game (533)
	Manufacturer = 533
if Manufacturer = Gear (65)
	Manufacturer = 65
if Manufacturer = Jansport (35)
	Manufacturer = 35
if Manufacturer = League (360)
	Manufacturer = 360
if Manufacturer = Legacy (1938)
	Manufacturer = 1938
if Manufacturer = MV Sport (84)
	Manufacturer = 84
if Manufacturer = MyU Apparel (32811)
	Manufacturer = 32811
if Manufacturer = RFSJ (RFSJ)
	Manufacturer = RFSJ
if Manufacturer = Russell (64)
	Manufacturer = 64
if Manufacturer = Under Armour (14908)
	Manufacturer = 14908
if Manufacturer = Wide World (107)
	Manufacturer = 107
if Manufacturer = Venley (VENLEY)
	Manufacturer = VENLEY
}

if SKU = Generate new
{
	Gosub Checklog
	return
} else {
	Gosub COMMENCE
	return
}
return

Checklog:
If(strlen(Username)<=0)
{
	Gosub Login
	return
}
 else {
	Gosub COMMENCE
	return
}
return

Login:
Gui, Add, Text,, User:
Gui, Add, Text, Password, Pass:
Gui, Add, Edit, vUser ym
Gui, Add, Edit, vPass
Gui, Add, Text, cBlue, Use your PuTTy login.
Gui, Add, Button, default gverify, Log In
Gui, Show
return

verify:
Gui, Submit, NoHide

If(strlen(User)<=0) {
    MsgBox You need a username!
} else {
	Gosub CheckPass
}
return

CheckPass:
If(strlen(Pass)<=0) {
    MsgBox You need a password!
} else {
	Gui, Destroy
	Gosub Login2
}
return

Login2:
SplashTextOn,,, Hands off!
Run, %A_Desktop%\PuTTY+\PuTTY+\putty
WinWait, 128.200.235.235
Sleep 750
Send %User%
Sleep 100
Send {Enter}
Sleep 100
Send %Pass%
Sleep 100
Send {Enter}
Sleep 100
MouseClickDrag, Left, 9, 84, 117, 84
Sleep 50
ClipWait
Sleep 100
SplashTextOff
If clipboard = Last login
    Gosub Loginisvalid
 else {
	WinClose 128.200.235.235
	Sleep 100
	MsgBox Recheck your login credentials!
	Gosub Login
}
return

Loginisvalid:
MsgBox, Login is valid! Press OK to continue.
WinClose 128.200.235.235
Sleep 100
Gosub COMMENCE

COMMENCE:
{

if Class = 1/4 zip non-hood (683) ; Need one for every class
	Class = 683
if Class = Baseball caps/hats (651)
	Class = 651
if Class = Crews/sweaters (631)
	Class = 631
if Class = Full zip non-hood (686)
	Class = 686
if Class = Hoods (635)
	Class = 635
if Class = Inf/Todd Pants/Bottm (675)
	Class = 675
if Class = Infant Bibs (678)
	Class = 678
if Class = Infant Blankets (677)
	Class = 677
if Class = Infant Onesies (672)
	Class = 672
if Class = Infant/Toddler (660)
	Class = 660
if Class = Infant/Toddler Hoods (673)
	Class = 673
if Class = Infant/Toddler Tops (671)
	Class = 671
if Class = Infant/Toddler Zips (674)
	Class = 674
if Class = Juniors tops (614)
	Class = 614
if Class = Knit sweaters (682)
	Class = 682
if Class = Logo Footwear (602)
	Class = 602
if Class = Misc Emblematic (754)
	Class = 754
if Class = Pants/shorts/boxers (640)
	Class = 640
if Class = T-Shirts (621)
	Class = 621
if Class = Women's pants/shorts (611)
	Class = 611
if Class = Youth Zip (667)
	Class = 667
if Class = Youth Hoods (668)
	Class = 668
if Class = T-Shirts (669)
	Class = 669
if Class = Zip Hoods (632)
	Class = 632
}

if SKU = Generate new
{
	Gosub Generate
	return
} else {
	Gosub Gogogo2
	return
}
return

Generate:
SplashTextOn,,, Hands off!
Run, %A_Desktop%\PuTTY+\PuTTY+\putty
Sleep 750
WinWait, 128.200.235.235
Sleep 50
Send %User%
Sleep 50
Send {Enter}
Sleep 50
Send %Pass%
Sleep 50
Send {Enter}
Sleep 50
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
Send {Down}
Sleep 100
Send {Down}
Sleep 100
Send {Down}
Sleep 100
Send {Down}
Sleep 100
Send {Down}
Sleep 100
Send {Down}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 50
Send {Down}
Sleep 50
Send {Down}
Sleep 50
Send {Down}
Sleep 50
Send {Down}
Sleep 50
Send {Down}
Sleep 50
Send {Enter}
Sleep 50
Send 1
Sleep 50
Send {Down}
Sleep 50
Send {Down}
Sleep 50
Send {Down}
Sleep 50
Send {Down}
Sleep 50
Send {Down}
Sleep 50
Send 1
Sleep 50
Send {Esc}
Sleep 50
Send {Enter}
Sleep 100
clipboard = ; Empty the clipboard
Sleep 100
MouseClickDrag, Left, 231, 292, 347, 292
Send, ^c
ClipWait, 2
if ErrorLevel
{
    MsgBox, The attempt to copy text onto the clipboard failed.
    return
}
Sleep 100
Send {Enter}
Sleep 100
Send {Up}
Sleep 100
Send {Up}
Sleep 100
Send {Up}
Sleep 100
Send {Up}
Sleep 100
Send {Up}
Sleep 250
Click, right, 300, 300
Sleep 250
Send {Enter}
Sleep 500
Send {Right}
Sleep 100
Send {Enter}
Sleep 250
Send {Up}
Sleep 100
Send {Enter}
Sleep 100
Send !{f4}
Sleep 50
Send {Enter}
Sleep 50
SKU:=clipboard
Sleep 50
SplashTextOff
Sleep 50
Gosub Gogogo2
Return

Gogogo2:
WinActivate 128.200.235.235 ; the actual process
SplashTextOn,,, Hands off!
Sleep 100
Send %SKU%
Sleep 100
Send {Enter}
Sleep 50
MouseClick, Left, 281, 208
Sleep 50
MouseClick, Left, 281, 208
ClipWait
Sleep 100

If clipboard = ITEM
    Gosub Gegege
 else {
    Send {Enter}
    SplashTextOff
    return	
}
return

Gegege:
Sleep 100
Send {Down}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 100
Send %Description%
Sleep 100
Send {Enter}
Sleep 100
Send %AltDescription%
Sleep 100
Send {Enter}
Sleep 100
Send %Manufacturer%
Sleep 100
Send {Enter}
Sleep 100
Send %Class%
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
Send %Price%
Sleep 100
Send {Enter}
Sleep 100
Send {Right}
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
Send %Cost%
Sleep 100
Send {Enter}
Sleep 100
Send y
Sleep 100
Send {Esc}
Sleep 100
Send {Esc}
Sleep 100
Send {Enter}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
Send %Quantity%
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
Sleep 100
WinActivate, putty+
EnvAdd, rCost, Cost
Sleep 50
EnvAdd, rPrice, Price
Sleep 50
EnvAdd, rUnits, Quantity
SplashTextOff
return

END:
WinActivate, 128.200.235.235
Sleep 100
Send {Esc}
Sleep 50
Send {Enter}
Sleep 50
Send {Down}
Sleep 50
Send {Enter}
Sleep 50
Send {Up}
Sleep 50
Send {Up}
Sleep 50
Send {Up}
Sleep 50
Gosub MainCourse