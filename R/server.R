server <- shiny::shinyServer(function(input, output, session ) {




  output$slot1<-shiny::renderUI ({
    moduleTestam_UI ('moduleTest',label='moduleTesto')                        # moduleTestam_UI è la funzione che definisce la ui del modulo : questa funzione viene definita nello sript del modulo e contiene la UI
  })                                                                          # il primo elemento di questa funzione è l'id che definisce il NS della app

  loadApp_moduleTest <-  shiny::callModule( moduleTest_Server, 'moduleTest',   #id deve avere il nome dell' ID argumente della funzione che contiene la UI
                                            stringsAsFactors = FALSE)

  # output$slot2<-shiny::renderUI ({
  #   moduleTestV2_UI ('moduleTestV2',label='moduleTestV2')
  # })
  #
  # loadApp_moduleTestV2 <-  shiny::callModule( moduleTestV2_Server, 'moduleTestV2',
  #                                         stringsAsFactors = FALSE, otrIN=loadApp_moduleTest)


  observeEvent (input$refreshBut,{

    # output$slot1<-shiny::renderUI ({
    #   moduleTestam_UI ('moduleTest',label='moduleTesto')
    # })
    #
     loadApp_moduleTest <-  shiny::callModule( moduleTest_Server, 'moduleTest',   #id deve avere il nome dell' ID argumente della funzione che contiene la UI
                                               stringsAsFactors = FALSE)

    print (paste0('refresh:',loadApp_moduleTest))
    output$slot2<-shiny::renderUI ({
      moduleTestV2_UI ('moduleTestV2',label='moduleTestV2')
    })

    loadApp_moduleTestV2 <-  shiny::callModule( moduleTestV2_Server, 'moduleTestV2',
                                                stringsAsFactors = FALSE, loadApp_moduleTest)
  })


})



#nota: allora ogni funzione shiny server può avere un return: nel return è ad esempio possibile mettere gli input
#della funzione (return(input))

#quando la funzione viene richiamata con callModule e salvata in una variabile (pippo=callModule(...))
#la variabile conterrà il return in questo caso gli input del modulo

#Se ora si crea una nuova funzione server per un nuovo modulo a questa possiamo assegnare un numero arbitrario di nuove opzioni
#additive rispetto a input, output e session, possiamo quindi creare una nuova funzione topolino=function(input, output, session, imported)

# quando andiamo a fare il callModule della funzione topolino potremmo settare come variabile imported la variabile in cui è stato salvato il return
# della prima funzione Server ( Es: paperino=callModule (topolino, 'topolino', imported=pippo) )

# a questo punto quando nel server topolino ci servirà un input contenuto nel primo server basterà richiamare imported$nomeDelWidget


