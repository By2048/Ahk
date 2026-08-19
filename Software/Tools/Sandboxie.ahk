
RegisterSoftware( "SandMan" , "Sandboxie" )

RegisterPosition( "Sandboxie" , Position(1700 ,  1100) )


#HotIf CheckWindowActive( "Sandboxie" )

    ^+r::Return ;重置图形设置

    F9::{
        files := "A:\Config\Lnks\Sandboxie.lnk "
        files .= "A:\Config\Lnks\SandboxiePlus.lnk"
        Run VSCode " --profile #Default " files, A_InitialWorkingDir, "Hide"
    }

#HotIf
