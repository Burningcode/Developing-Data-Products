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
                           paid at market equilbrium.
                           
                           This app will provide you with the following outputs.
                        Price, the price of the option should be at fair market value. 
                                
                        Delta, measures the sensitivity of an option's theoretical value to a change in the price of the underlying asset.
                                
                        Gamma, measures the rate of change in the delta for each one-point increase in the underlying asset
                                
                        Vega, measures the sensitivity of the price of an option to changes in volatility
                                
                        Theta, a measure of the time decay of an option, the dollar amount that an option will lose each day due to the passage of time
                                
                        Rho, rate at which the price of a derivative changes relative to a change in the risk-free rate of interest"
                                
                           
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