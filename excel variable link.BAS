Sub Main
	'kj pederson kenneth.j.pederson@nasa.gov
    Dim App As femap.model
    Set App = feFemap()

    Dim fs As femap.Set
    Dim fLS As femap.LoadSet
    Dim fLD As femap.LoadDefinition
    Dim flg As femap.LoadGeom
    Dim loadDefID(47) As Integer
    Dim loadAct(47) As Double
    Dim surf(47) As Integer

    Dim nID As Long
    Dim dPress As Double

    Set fs = App.feSet
    Set fLS = App.feLoadSet
    Set fLD = App.feLoadDefinition
    Set flg = App.feLoadGeom

    loadAct(0)=5.5
loadAct(1)=5.7

loadAct(2)=5.5

loadAct(3)=5.5

loadAct(4)=5.5

loadAct(5)=4.4

loadAct(6)=1.3
loadAct(7)=1.3


loadAct(8)=3.7


loadAct(9)=3.7


loadAct(10)=3.7


loadAct(11)=5.0

loadAct(12)=5.0



loadAct(13)=2.8
loadAct(14)=0.5


loadAct(15)=2.4


loadAct(16)=1.4



loadAct(17)=1.4


loadAct(18)=3.7
loadAct(19)=3.7




surf(0)=2687
surf(1)=2694

surf(2)=2685

surf(3)=2642

surf(4)=2640

surf(5)=1969

surf(6)=2431
surf(7)=1966


surf(8)=2024


surf(9)=2080


surf(10)=2416


surf(11)=2130

surf(12)=2175



surf(13)=1176
surf(14)=1175


surf(15)=1229


surf(16)=1327



surf(17)=618


surf(18)=446
surf(19)=409



For i = 0 To UBound(surf)
    If surf(i) <> 0 Then lentt = lentt + 1
Next i


fLS.ID = 2
fLD.ID = 1
nID = 322
dPress = 5545
For i = 1 To lentt
    ' Create load definition
    fLD.setID = 2
    fLD.PutAll( i, FT_GEOM_LOAD, FLT_SEPRESSURE, "Pressure load" )

'    Create geometric load
 '   flg.setID = 1
 '   flg.LoadDefinitionID = loadDefID(i-1)
 '   flg.type = FLT_SEPRESSURE
 '   flg.geomID = surf(i-1)
 '   flg.geomTYPE = FT_SURFACE
 '   flg.load( 0 ) = dPress
 '   flg.Put( flg.NextEmptyID() )
 fLD.ID = i
nID = surf(i-1)
dPress = loadAct(i-1)
    flg.setID = fLS.ID
    flg.LoadDefinitionID = fLD.ID
    flg.type = FLT_SEPRESSURE
    flg.geomID = nID
    flg.geomTYPE = FT_SURFACE
    flg.load( 0 ) = dPress
    flg.Put( flg.NextEmptyID() )
Next

End Sub
