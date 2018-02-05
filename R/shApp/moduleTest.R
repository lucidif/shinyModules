#first module test

moduleTest_UI <- function(id, label = "binning") {

    fluidPage(

      wellPanel(
        fluidRow(
          column(12,
                 helpText('hello world from test module')
                 )
        )
      )

    )

}

moduleTest_Server <- function(input, output, session, stringsAsFactors) {



}
