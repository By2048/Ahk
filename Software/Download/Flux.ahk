
RegisterSoftware( "fluxdown-desktop" , "Flux" )

RegisterPosition( "Flux" , Position( "[Center][1]" , 1600 , 888 ) , "Default" )

w := Screen2.w - 6
h := 666
x := Screen2.x + ( Screen2.w - w ) / 2
y := Screen2.y + ( Screen2.h - h ) - Taskbar.h - 123
pos := Position( x , y , w , h )
RegisterPosition( "Flux" , pos , "Backup" )


#HotIf CheckWindowActive( "Flux" )

    Space::Send "^n"

#HotIf
