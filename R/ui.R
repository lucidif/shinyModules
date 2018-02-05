shiny::shinyUI (

  shiny::fluidPage (

    shiny::wellPanel(
      shiny::fluidRow(
        shiny::column(12,
                      shiny::actionButton('refreshBut', label='refresh')
                      )
      )
    ),

    shiny::wellPanel (

      shiny::fluidRow(
        shiny::column (12,
                shiny::helpText('Hello World')
        )
      ),

      shiny::fluidRow(

        shiny::column(12,
               shiny::uiOutput('slot1')
               ),

        shiny::column(12,
               shiny::uiOutput('slot2')
               )

      )

    )

  )

)
