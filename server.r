library(ggplot2)
X1 <- function(a,b,c){(-b + sqrt(b^2-4*a*c))/(2*a)} 
X2 <- function(a,b,c){(-b - sqrt(b^2-4*a*c))/(2*a)}
y1 <- function(a,b,c,x){a*x^2+b*x+c}
A<- function(a){a/abs(a)}
eq<-function(a,b,c){paste(a,"* x^2 + ",b,"* x + ",c)}
sol<-function(x1,x2){paste("x = ",x1," , ", x2)}
#x <- seq(min(x1-abs(x1-x2),x2-abs(x1-x2),0), max(x1+abs(x1-x2), x2 + abs(x1-x2), 0), 1000)
#y <- input$a*x^2+input$b*x+input$c
par(xaxs = "r")
shinyServer(
        function(input,output){
                output$oa<-renderPrint({eq(input$a,input$b,input$c)})
                output$sol<-renderPrint({sol(X1(input$a,input$b,input$c),X2(input$a,input$b,input$c))})
                output$newPlot <- renderPlot({
                        as<-A(input$a)
                        x1<-X1(input$a,input$b,input$c)
                        x2<-X2(input$a,input$b,input$c)
                        x<-seq(2*min(x1[!is.na(x1 & !is.infinite(x1))],x2[!is.na(x2)& !is.infinite(x2)],-.5),2*max(x1[!is.na(x1)& !is.infinite(x1)],x2[!is.na(x2)& !is.infinite(x2)],.5),length = 1000)
                        y<-y1(input$a,input$b, input$c, x)
                        qplot(x = x, y=y, geom = "line")+ geom_hline(yintercept=0, lwd=1) + geom_vline(xintercept = 0, lwd = 1)+ geom_point(x =c(x1,x2),y=c(0,0), col = "red", size = 3)+ annotate("text", label = paste("x2 = ", x2), x=min(x1[!is.na(x1 & !is.infinite(x1))],x2[!is.na(x2)& !is.infinite(x2)],0), y=as*2, size = 6, colour= "red")+ annotate("text", label = paste("x1 = ", x1), x=max(x1[!is.na(x1 & !is.infinite(x1))],x2[!is.na(x2)& !is.infinite(x2)],0), y=as*1, size = 6, colour= "red")
                        
                })
        }
)