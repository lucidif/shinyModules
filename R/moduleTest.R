#first module test

moduleTestam_UI <- function(id, label = "binning") {

    nms<- NS(id)

    fluidPage(

      wellPanel(
        fluidRow(
          column(12,
                 helpText('hello world from test module')
                 ),
        fluidRow(
          column (12,
                  textInput(nms('myText'),'write samething',value='nessun testo')

                  )
        ),
        fluidRow(

          column(12,
                 actionButton(nms('butto'), 'button')
                 )

        )

        )
      )

    )

}

moduleTest_Server <- function(input, output, session, stringsAsFactors, valori) {

  nse<-session$ns


  valori<-reactiveValues(tt='none')

  observeEvent(input$butto,{
    print ('hello module1 button')
    valori$tt<-input$myText
    #print (paste0('observe:',isolate(valori$tt)))
    print (paste0('observe:',valori$tt))

    #return (valori$tt)
  }) ##anche se l'observe cambia il valore di tt print resta quello inziale in cui il server è stato caricato


  #print (isolate(valori$tt))

  return (valori)

  #print (paste0('isolate(valori$tt):', isolate(valori$tt)))

  #tt<-valori$tt
  #print (paste0('isolate(valori$tt)',tt,'tt',tt))
  #return (tt)
  #print (paste0 ('tt=',tt))
}
