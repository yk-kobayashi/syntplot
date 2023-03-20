#usage: [this] [plot_position_file] [chromosome-position_x] [chromosome-position_y] [name_s] [name_y] [label_textsize] [draw_width] [draw_height] [draw_dpi]

args <- commandArgs(trailingOnly = T)

dat <- read.delim(args[1])
xname <- args[2]
yname <- args[3]
lengthx <- read.delim(args[4], header = F)
lengthy <- read.delim(args[5], header = F)
positionx <- read.delim(args[6], header = F)
positiony <- read.delim(args[7], header = F)
labelsize <- as.numeric(args[8])
drawwidth <- as.numeric(args[9])
drawheight <- as.numeric(args[10])
drawdpi <- as.numeric(args[11])

xrange <- sum(lengthx[2])
yrange <- sum(lengthy[2])

contigname1 <- unlist(positionx[1])
contigpos1 <- unlist(positionx[2])

contigname2 <- unlist(positiony[1])
contigpos2 <- unlist(positiony[2])

library(ggplot2)
ggplot(data = dat, 
       mapping = aes(x = subject, y = query, col=identity)) + 
  geom_path() +
  scale_x_continuous(limits=c(0,xrange),breaks=c(contigpos1,xrange),labels=c(contigname1,""), expand=c(0,0)) +
  scale_y_continuous(limits=c(0,yrange),breaks=c(contigpos2,yrange),labels=c(contigname2,""), expand=c(0,0)) +
  labs(title = " ",
       x = xname,
       y = yname,
       caption = " ") +
  expand_limits(x=0, y=0)+
  scale_color_gradientn(limits = c(0,100), colors=c("white","yellow","red","blue","black"), values = c(0,0.5,0.7,0.9,1)) +
  theme(axis.text.x = element_text(angle = 315, hjust = 0, size=labelsize),
        axis.text.y = element_text(angle = 315, vjust = 1, size=labelsize),plot.margin=unit(c(1,0.2,0.2,0.5), 'cm')) +
  coord_fixed()
ggsave(paste(xname,"vs",yname,".png",sep=""), width=drawwidth, height=drawheight, dpi=drawdpi)
