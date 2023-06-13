#usage: [this] [plot_position_file] [chromosome-position_x] [chromosome-position_y] [name_s] [name_y] [label_textsize] [draw_width] [draw_height] [draw_dpi] [draw_line_width] [output_name]

args <- commandArgs(trailingOnly = T)

dat <- read.delim(args[1])
xname <- args[2]
yname <- args[3]
lengthx <- read.delim(args[4], header = F)
lengthy <- read.delim(args[5], header = F)
labelsize <- as.numeric(args[6])
drawwidth <- as.numeric(args[7])
drawheight <- as.numeric(args[8])
drawdpi <- as.numeric(args[9])
drawlinewidth <- as.numeric(args[10])
outputname <- args[11]

xrange <- as.numeric(lengthx[2])
yrange <- as.numeric(lengthy[2])

library(ggplot2)
library(scales)
ggplot(data = dat, 
       mapping = aes(x = subject, y = query, col=identity)) + 
  geom_path(size=drawlinewidth) +
  scale_x_continuous(limits=c(0,xrange),labels = label_number(scale_cut = cut_si("bp")), expand=c(0,0)) +
  scale_y_continuous(limits=c(0,yrange),labels = label_number(scale_cut = cut_si("bp")), expand=c(0,0)) +
  labs(title = " ",
       x = xname,
       y = yname,
       caption = " ") +
  expand_limits(x=0, y=0) +
  scale_color_gradientn(limits = c(0,100), colors=c("white","yellow","red","blue","black"), values = c(0,0.5,0.7,0.9,1)) +
  theme(axis.text.x = element_text(size=labelsize),
        axis.text.y = element_text(size=labelsize),plot.margin=unit(c(1,0.2,0.2,0.5), 'cm')) +
  coord_fixed()
ggsave(paste(outputname,".png",sep=""), width=drawwidth, height=drawheight, dpi=drawdpi)
