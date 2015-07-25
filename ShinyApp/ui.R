library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage("J.H.U. Project",
        tabPanel("Overview",
                 mainPanel("This application is meant to help anyone that needs to do opitions 
                           calculations on the fly. To use need to specify the option type, spot price,
                           time to maturity in years, strike price, risk free rate, and the volatility
                           in perecent. 
                           It will then provide Delta, Gamma, Vega, Theta, & Rho.
                           If you enter in the variable data for the opition you our considering 
                           it will then provide you with the theoritecal price that should be
                           paid at market equilbrium."
                           
                         )
                 ),
        tabPanel("Black Scholes App",
                sidebarLayout(
                        sidebarPanel(
                                selectInput("optionType", label = h5("Option type"), 
                                            choices = list("Call" = 1, "Put" = 2), selected = 1),
                                numericInput("spot", 
                                             label = h5("Spot Price (S)"), 
                                             value = 100),
                                numericInput("timetomat", 
                                             label = h5("Time to maturity (T in years)"), 
                                             value = 1),
                                numericInput("strike", 
                                             label = h5("Strike Price (K)"), 
                                             value = 90),
                                numericInput("r_f", 
                                             label = h5("Risk free rate (r in percent)"), 
                                             value = 5),
                                numericInput("sigma", 
                                             label = h5("Volatility (sigma in percent)"), 
                                             value = 20),
                                checkboxGroupInput("greekGroup", 
                                                   label = h5("Display Greeks"), 
                                                   choices = list("Delta" = 1, 
                                                                  "Gamma" = 2, 
                                                                  "Vega" = 3,
                                                                  "Theta" = 4,
                                                                  "Rho" = 5), )
                        ),
                        mainPanel(
                                textOutput("price"),
                                br(),
                                textOutput("delta"),
                                br(), 
                                textOutput("gamma"),
                                br(), 
                                textOutput("vega"),
                                br(), 
                                textOutput("theta"),
                                br(),
                                textOutput("rho")
                        )
                )
        )
))