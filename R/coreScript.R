

#source ('R/requirements.R')
#source ("R/shApp/modules/modSlot1/moduleTest.R")  # oggetto "moduleTest_Server" non trovato
#source ("R/shApp/moduleTest.R")                    # oggetto "moduleTest_Server" non trovato
#source ("R/moduleTest.R")

#shiny::runApp("R/shApp")                         # si blocca l'istallazione

HiCeekR=function (){
  shiny::runApp("R/")
}

## in conclusione devi mettere tutti gli script dentro il folder R

