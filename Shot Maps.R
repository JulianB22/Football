#A shot map using RStudio for Mo Salah´s shots in the 2019/20 season

library(ggplot2)
library(png)

Shots = read.csv("ShotLocations (2).csv")
Salah = readPNG("Salah.png")
shotcolours = c("goal" ="blue", "missed" = "green4", "saved" = "yellow")

#A half-pitch is plotted before seperating shots into outcome (goal, missed, saved) by colour and body part (head, left, right) by shape

#Includes a profile picture of Mo Salah and his total xG for the illustrated shots

paste("xG:", sum(Shots$xG))

ggplot(Shots, aes(x =locx, y = locy)) +
  geom_point(aes(col = Outcome, shape=BodyPart), size = 10*Shots$xG+1, alpha = 0.5) +
  scale_colour_manual(values = shotcolours) +
  geom_segment(aes(x = 37, y = 0, xend = -37, yend= 0)) + 
  geom_segment(aes(x = -37, y = 0, xend = -37, yend= 57)) +
  geom_segment(aes(x = 37, y = 0, xend = 37, yend= 57)) +
  geom_segment(aes(x = 37, y = 57, xend = -37, yend= 57)) +
  geom_segment(aes(x = -10, y = 0, xend = -10, yend= 6)) +
  geom_segment(aes(x = 10, y = 0, xend = 10, yend= 6)) +
  geom_segment(aes(x = -10, y = 6, xend = 10, yend= 6)) +
  geom_segment(aes(x = -4, y = -1, xend = 4, yend= -1)) +
  geom_segment(aes(x = -4, y = -1, xend = -4, yend= 0)) +
  geom_segment(aes(x = 4, y = -1, xend = 4, yend= 0)) +
  geom_segment(aes(x = -22, y = 0, xend = -22, yend= 18)) +
  geom_segment(aes(x = 22, y = 0, xend = 22, yend= 18)) +
  geom_segment(aes(x = -22, y = 18, xend = 22, yend= 18)) +
  xlim(-37,37) + ylim(-1,73) +
  theme(axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_blank(),
        panel.background = element_rect(fill="lightgrey")) +
  annotate("text", label = "Mo Salah - 19/20", x=0, y=70) +
  annotate("text", label = paste("xG:", sum(Shots$xG)), x=0, y=65) +
  annotation_raster(Salah, xmin=25, xmax= 35, y=65, ymax= 75)

#The map shows that when shooting from outside of the area, Mo Salah tends to shoot from the right side of the pitch but with his left foot. 

#Analysts can use this information to draw the conclusion that he likes to "cut inside" from the right wing onto his stronger foot and therefore oppositions defenders should try to force him wide. 
