Gui, Add, Text, Number, SKU:
Gui, Add, Text,, Description:
Gui, Add, Text,, AltDescription:
Gui, Add, Text,, Class:
Gui, Add, Text,, Retail (XX.XX):
Gui, Add, Text,, Cost (XX.XX):
Gui, Add, Text,, Quantity:
Gui, Add, ComboBox, vSKU ym, Generate new
Gui, Add, Edit, vDescription
Gui, Add, Edit, vAltDescription
Gui, Add, DropDownList, vClass, 1/4 zip non-hood (683)|Baseball caps/hats (651)|Crews/sweaters (631)|Full zip non-hood (686)|Hoods (635)|Inf/Todd Pants/Bottm (675)|Infant Bibs (678)|Infant Blankets (677)|Infant Onesies (672)|Infant/Toddler (660)|Infant/Toddler Hoods (673)|Infant/Toddler Tops (671)|Infant/Toddler Zips (674)|Juniors tops (614)|Knit sweaters (682)|Logo Footwear (602)|Misc Emblematic (754)|Pants/shorts/boxers (640)|T-Shirts (621)|Women's pants/shorts (611)|Youth Hoods (668)|Youth T-Shirts (669)|Youth Zip Hoods (667)|Zip Hoods (632)
Gui, Add, Edit, vPrice
Gui, Add, Edit, vCost
Gui, Add, Edit, vQuantity
Gui, Add, Button, default gOK, OK
Gui, Add, Button, default gEND, End order
Gui, Add, Button, default gPlus ym, +
Gui, Show
return

Plus:
Gui, Submit, NoHide
StringReplace, NewStr, OldStr, xs, sm, all
StringReplace, NewStr, OldStr, sm, med, all
StringReplace, NewStr, OldStr, med, lrg, all
StringReplace, NewStr, OldStr, lrg, xl, all
StringReplace, NewStr, OldStr, xl, 2xl, all
return

OK:
return

END:
return