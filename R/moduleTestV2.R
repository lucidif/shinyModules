moduleTestV2_UI <- function(id, label = "binning") {
  nmsV2=NS(id)
  fluidPage(

    wellPanel(
      fluidRow(
        column(12,
               textOutput(nmsV2('txOut'))
        )
      ),
      fluidRow(
        column(12,
               actionButton(nmsV2('but'), "button")
               )
      )
    )

  )

}

moduleTestV2_Server <- function(input, output, session, stringsAsFactors,
                                imported) {

  print ('hello module 2')
  #otrIN='test'
  output$txOut<-renderText({
    imported$tt
    #"testa"
  })

  observeEvent (input$but,{
    print ('hello button')
    output$txOut<-renderText({
      imported$tt
      #"testa"
    })
  })

}
