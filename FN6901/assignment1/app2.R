# Acknowledgement
# This shiny app (Tan & Sons Dental Clinic) inherits some css styles from my web development
# project during my undergraduate study at NTU. That project could be viewed using link below
# https://github.com/NABEEL004/IE4717_DentalClinic



#TODO
# 1. Input validation
# 2. Fancier stylings/layouts

library(shiny)
library(shinythemes)

# Define UI
ui <- fluidPage(
  theme = shinytheme('flatly'),
  tags$head(
    tags$title("Tan & Sons Dental Clinic"),
    tags$link(rel = "stylesheet", type = "text/css", href = "assignment1.css")
    # tags$script(HTML("
    #   $(document).on('click', '#goToAppointment', function() {
    #     window.location.href = '#Appointment';
    #   });
    # "))
    
  ),
  
  # Navigation bar with tabs
  navbarPage(
    id = "navbar",
    #title = "Tan & Sons Dental Clinic",
    title = HTML('<a class="navbar-brand" onclick="Shiny.onInputChange(\'title_click\', Math.random())">Tan & Sons Dental Clinic</a>'),
    
    
    # Home tab
    tabPanel(
      "Home",
      titlePanel("Welcome to Tan & Sons Dental Clinic"),
      fluidRow(
        # Left column (Image)
        column(6,
               div(
                 class = "img-container", img(src = "dental.jpg", width = "100%")
               )),
        
        # Right column divided into two blocks
        column(6,
               class = "right-column",
               fluidRow(# First block
                 column(
                   12,
                   h2("About Us", align = "center"),
                   wellPanel(
                     p(
                       "With over three decades of experience, our skilled and caring team provides comprehensive dental services in a welcoming environment.
                   From routine check-ups to cosmetic enhancements, we prioritize your oral health and well-being, ensuring your smile is healthy and confident.",
                       style = "text-align: justify;"
                     ),
                     class = "well-panel"
                   )
                 )),
               fluidRow(# Second block
                 column(
                   12,
                   h2("Why Choose Us?", align = "center"),
                   wellPanel(tags$ul(
                     tags$li(
                       "Experienced Professionals: You will receive top-notch dental care from skilled and knowledgeable professionals."
                     ),
                     tags$li(
                       "Comprehensive Services: Whether you need routine check-ups or cosmetic enhancements, we offer a wide range of dental services to address your unique needs."
                     ),
                     tags$li(
                       "Patient-Centered Care: We prioritize your comfort and well-being, through a welcoming and caring environment."
                     )
                   ),
                   class = "well-panel")
                 )))
      ),
      # Button to redirect to Appointment tab
      fluidRow(column(
        12,
        align = "center",
        actionButton("goToAppointment", "Book With Us Today", style = "margin-top: 20px;")
      )),
      
      # Footer
      fluidRow(column(12,
                      div(
                        class = "footer",
                        p("© 2024 Tan & Sons Dental Clinic. All rights reserved.",
                          style = "text-align: center; padding: 20px; background-color: #f8f9fa; margin-top: 40px;")
                      )))
      
    ),
    
    # Our Doctors tab
    tabPanel(
      "Our Doctors",
      titlePanel("Meet Our Doctors"),
      
      # Introduction text
      fluidRow(column(12, h2("Our Team")),
               column(
                 12,
                 p(
                   "We have a team of experienced and highly qualified dental professionals ready to provide you with the best care. Here is a brief introduction to our doctors."
                 )
               )),
      
      # Doctors displayed horizontally in a single row with centered content
      fluidRow(
        column(4, wellPanel(
          div(
            img(
              src = "Doctor1.png",
              width = "75%",
              height = "auto"
            ),
            h3("Dr. Lee"),
            p(
              "Dr. Lee, a distinguished alumni of NUS, holds a BDS degree, excelling in dental surgery.
                    Her dedication to prosthodontics and crowning makes her your ideal choice for comprehensive dental care.
                    Experience her commitment to crafting not just smiles but stories of confidence and well-being. "
              ,
              style = "text-align: justify;"
            ),
            style = "text-align: center;"  # Centering the text and image
          )
        )),
        column(4, wellPanel(
          div(
            img(
              src = "Doctor2.png",
              width = "75%",
              height = "auto"
            ),
            h3("Dr. Shawn"),
            p(
              "Dr. Shawn is a brilliant dental professional with a BDS degree from King's College London,
                    a renowned institution in the field. With over 15 years of extensive experience in both
                    private practice and government dental agencies, he is a trusted expert
                    in comprehensive dental care.
"
              ,
              style = "text-align: justify;"
            ),
            style = "text-align: center;"  # Centering the text and image
          )
        )),
        column(4, wellPanel(
          div(
            img(
              src = "Doctor3.png",
              width = "75%",
              height = "auto"
            ),
            h3("Dr. Shanice"),
            p(
              "     Dr. Shanice graduates from Harvard University. With a keen eye for aesthetics and
                    a strong foundation in the latest advancements, she is a true visionary in our dental clinic.
                    Dr. Shanice seamlessly merges traditional artistry with modern techniques to create
                    dental masterpieces.
"
              ,
              style = "text-align: justify;"
            ),
            style = "text-align: center;"  # Centering the text and image
          )
        ))
      ),
      
      # Button to redirect to Appointment tab
      fluidRow(column(
        12,
        align = "center",
        actionButton("goToAppointmentFromDoctors", "Book With Us Today", style = "margin-top: 20px;")
      )),
      
      # Footer (same as in Home tab)
      fluidRow(column(
        12,
        div(
          class = "footer",
          "© 2024 Tan & Sons Dental Clinic. All rights reserved.",
          style = "text-align: center; margin-top: 40px; padding: 20px; background-color: #f8f9fa;"
        )
      ))
    ),
    
    # Services & Fees tab with dropdown for categories
    navbarMenu(
      title = "Services & Fees",
      # Signature Services sub-tab
      tabPanel(
        "Signature Services",
        titlePanel("Signature Dental Services"),
        fluidRow(
          column(12,
                 p(
                   "Here are the exclusive signature services we offer:"
                 )),
          # Services layout in boxes
          fluidRow(column(4,
                          div(
                            class = "service-box",
                            img(src = "dental_implant.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Dental Implant"),
                              p(
                                "Dental implants are a permanent solution to missing teeth or wearing removable dentures. They are fixtures placed into your jaw bone to replace both the tooth and root of your teeth.

"
                              ),
                              p("Estimated Fee: $200")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "wisdom_surg.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Wisdom Tooth Surgery"),
                              p(
                                "Wisdom teeth, which usually erupt between ages 18 to 24, can often grow in a disorderly manner and sometimes require extractions.

"
                              ),
                              p("Estimated Fee: $300")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "root_canal.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Root Canal Treatment"),
                              p(
                                "The pulp in your tooth, consisting of nerves and blood vessels, can become diseased from decay or injury. A root canal treatment involves cleaning out the damaged pulp.

"
                              ),
                              p("Estimated Fee: $500")
                            )
                          ))),
          fluidRow(column(4,
                          div(
                            class = "service-box",
                            img(src = "dental_implant.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Dental Implant"),
                              p(
                                "Dental implants are a permanent solution to missing teeth or wearing removable dentures. They are fixtures placed into your jaw bone to replace both the tooth and root of your teeth.

"
                              ),
                              p("Estimated Fee: $200")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "wisdom_surg.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Wisdom Tooth Surgery"),
                              p(
                                "Wisdom teeth, which usually erupt between ages 18 to 24, can often grow in a disorderly manner and sometimes require extractions.

"
                              ),
                              p("Estimated Fee: $300")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "root_canal.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Root Canal Treatment"),
                              p(
                                "The pulp in your tooth, consisting of nerves and blood vessels, can become diseased from decay or injury. A root canal treatment involves cleaning out the damaged pulp.

"
                              ),
                              p("Estimated Fee: $500")
                            )
                          )))
        ),
        # Button to redirect to Appointment tab
        fluidRow(column(
          12,
          align = "center",
          actionButton("goToAppointmentsig", "Book With Us Today", style = "margin-top: 20px;")
        )),
        
        # Footer (same as in Home tab)
        fluidRow(column(
          12,
          div(
            class = "footer",
            "© 2024 Tan & Sons Dental Clinic. All rights reserved.",
            style = "text-align: center; margin-top: 40px; padding: 20px; background-color: #f8f9fa;"
          )
        ))
      ),
      
      # General Dentistry sub-tab
      tabPanel(
        "General Dentistry Servies",
        titlePanel("General Dental Services"),
        fluidRow(
          column(12,
                 p(
                   "Here are the general dental services we offer:"
                 )),
          # Services layout in boxes
          fluidRow(column(4,
                          div(
                            class = "service-box",
                            img(src = "dental_implant.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Dental Implant"),
                              p(
                                "Dental implants are a permanent solution to missing teeth or wearing removable dentures. They are fixtures placed into your jaw bone to replace both the tooth and root of your teeth.

"
                              ),
                              p("Estimated Fee: $200")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "wisdom_surg.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Wisdom Tooth Surgery"),
                              p(
                                "Wisdom teeth, which usually erupt between ages 18 to 24, can often grow in a disorderly manner and sometimes require extractions.

"
                              ),
                              p("Estimated Fee: $300")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "root_canal.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Root Canal Treatment"),
                              p(
                                "The pulp in your tooth, consisting of nerves and blood vessels, can become diseased from decay or injury. A root canal treatment involves cleaning out the damaged pulp.

"
                              ),
                              p("Estimated Fee: $500")
                            )
                          ))),
          fluidRow(column(4,
                          div(
                            class = "service-box",
                            img(src = "dental_implant.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Dental Implant"),
                              p(
                                "Dental implants are a permanent solution to missing teeth or wearing removable dentures. They are fixtures placed into your jaw bone to replace both the tooth and root of your teeth.

"
                              ),
                              p("Estimated Fee: $200")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "wisdom_surg.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Wisdom Tooth Surgery"),
                              p(
                                "Wisdom teeth, which usually erupt between ages 18 to 24, can often grow in a disorderly manner and sometimes require extractions.

"
                              ),
                              p("Estimated Fee: $300")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "root_canal.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Root Canal Treatment"),
                              p(
                                "The pulp in your tooth, consisting of nerves and blood vessels, can become diseased from decay or injury. A root canal treatment involves cleaning out the damaged pulp.

"
                              ),
                              p("Estimated Fee: $500")
                            )
                          )))
        ),
        
        # Button to redirect to Appointment tab
        fluidRow(column(
          12,
          align = "center",
          actionButton("goToAppointmentgen", "Book With Us Today", style = "margin-top: 20px;")
        )),
        
        # Footer (same as in Home tab)
        fluidRow(column(
          12,
          div(
            class = "footer",
            "© 2024 Tan & Sons Dental Clinic. All rights reserved.",
            style = "text-align: center; margin-top: 40px; padding: 20px; background-color: #f8f9fa;"
          )
        ))
        
      ),
      
      # Cosmetic Dentistry sub-tab
      tabPanel(
        "Cosmetic Dentistry Servies",
        titlePanel("Cosmetic Dental Services"),
        fluidRow(
          column(12,
                 p(
                   "Here are the cosmetic dental services we offer:"
                 )),
          # Services layout in boxes
          fluidRow(column(4,
                          div(
                            class = "service-box",
                            img(src = "dental_implant.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Dental Implant"),
                              p(
                                "Dental implants are a permanent solution to missing teeth or wearing removable dentures. They are fixtures placed into your jaw bone to replace both the tooth and root of your teeth.

"
                              ),
                              p("Estimated Fee: $200")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "wisdom_surg.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Wisdom Tooth Surgery"),
                              p(
                                "Wisdom teeth, which usually erupt between ages 18 to 24, can often grow in a disorderly manner and sometimes require extractions.

"
                              ),
                              p("Estimated Fee: $300")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "root_canal.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Root Canal Treatment"),
                              p(
                                "The pulp in your tooth, consisting of nerves and blood vessels, can become diseased from decay or injury. A root canal treatment involves cleaning out the damaged pulp.

"
                              ),
                              p("Estimated Fee: $500")
                            )
                          ))),
          fluidRow(column(4,
                          div(
                            class = "service-box",
                            img(src = "dental_implant.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Dental Implant"),
                              p(
                                "Dental implants are a permanent solution to missing teeth or wearing removable dentures. They are fixtures placed into your jaw bone to replace both the tooth and root of your teeth.

"
                              ),
                              p("Estimated Fee: $200")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "wisdom_surg.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Wisdom Tooth Surgery"),
                              p(
                                "Wisdom teeth, which usually erupt between ages 18 to 24, can often grow in a disorderly manner and sometimes require extractions.

"
                              ),
                              p("Estimated Fee: $300")
                            )
                          )),
                   column(4,
                          div(
                            class = "service-box",
                            img(src = "root_canal.jpeg", class = "service-image"),
                            div(
                              class = "service-content",
                              h3("Root Canal Treatment"),
                              p(
                                "The pulp in your tooth, consisting of nerves and blood vessels, can become diseased from decay or injury. A root canal treatment involves cleaning out the damaged pulp.

"
                              ),
                              p("Estimated Fee: $500")
                            )
                          )))
        ),
        
        # Button to redirect to Appointment tab
        fluidRow(column(
          12,
          align = "center",
          actionButton("goToAppointmentcos", "Book With Us Today", style = "margin-top: 20px;")
        )),
        
        # Footer (same as in Home tab)
        fluidRow(column(
          12,
          div(
            class = "footer",
            "© 2024 Tan & Sons Dental Clinic. All rights reserved.",
            style = "text-align: center; margin-top: 40px; padding: 20px; background-color: #f8f9fa;"
          )
        ))
        
      )
    ),
    
    # Appointment tab
    tabPanel(
      "Appointment",
      titlePanel("Book an Appointment"),
      fluidRow(column(
        6,
        wellPanel(
          h3("Online Booking Form"),
          textInput("name", "Name: *", placeholder = "Enter your name"),
          textInput("email", "Email: *", placeholder = "Enter your email"),
          selectInput(
            "doctor",
            "Preferred Doctor: ",
            choices = c("Dr. Lee", "Dr. Shanice", "Dr. Shawn"),
            selected = "Dr. Lee"
          ),
          dateInput("date", "Preferred Date:"),
          selectInput(
            "time",
            "Preferred Time: ",
            choices = c(
              "9:00-10:00",
              "10:00-11:00",
              "11:00-12:00",
              "13:00-14:00",
              "14:00-15:00",
              "15:00-16:00",
              "16:00-17:00",
              "17:00-18:00"
            )
          ),
          actionButton("submit", "Submit")
        )
      ),
      column(
        6,
        wellPanel(h3("Contact Us"),
                  h5(
                    "Phone: ", a(href = "tel:+1234567890", "+123-456-7890")
                  ),
                  h5(
                    "Email: ",
                    a(href = "mailto:dental@tansons.com", "dental@tansons.com")
                  )),
        wellPanel(
          h3("Location"),
          HTML(
            '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.7236097353975!2d103.68065877502512!3d1.3422105986450747!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da0f9e11806bb7%3A0xd8a177c86289dff1!2sGaia%20-%20Nanyang%20Business%20School!5e0!3m2!1sen!2ssg!4v1726686038367!5m2!1sen!2ssg" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>'
          )
        )
      )),
      # Footer (same as in Home tab)
      fluidRow(column(
        12,
        div(
          class = "footer",
          "© 2024 Tan & Sons Dental Clinic. All rights reserved.",
          style = "text-align: center; margin-top: 40px; padding: 20px; background-color: #f8f9fa;"
        )
      ))
      
    )
    
  )
)

# Define server logic
server <- function(input, output, session) {
  observeEvent(input$goToAppointment, {
    updateNavbarPage(session, "navbar", selected = "Appointment")
  })
  
  observeEvent(input$goToAppointmentFromDoctors, {
    updateNavbarPage(session, "navbar", selected = "Appointment")
  })
  
  observeEvent(input$goToAppointmentsig, {
    updateNavbarPage(session, "navbar", selected = "Appointment")
  })
  
  observeEvent(input$goToAppointmentgen, {
    updateNavbarPage(session, "navbar", selected = "Appointment")
  })
  
  observeEvent(input$goToAppointmentcos, {
    updateNavbarPage(session, "navbar", selected = "Appointment")
  })
  
  observeEvent(input$submit, {
    validate(
      need(input$name != '', "Name is required."),
      need(input$email != '', "Email is required.")
    )
    
    showModal(
      modalDialog(
        title = "Appointment Confirmed",
        paste("Thank you for choosing Tan & Sons Dental Clinic!"),
        easyClose = TRUE,
        footer = NULL
      )
    )
  })
  
  observeEvent(input$title_click, {
    updateNavbarPage(session, "navbar", selected = "Home")
  })
  
  
  
  
  
  
}

# Run the application
shinyApp(ui = ui, server = server)
