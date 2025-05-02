print("Strengths&Difficulties")

items_hyperactivity <- c("restles","fidgety","distrac","reflect","attends")

items_emotion <- c("somatic","worries","unhappy","clingy","afraid")
rowMeans(SDQ[items_emotion], na.rm = T)*5
SDQ$S_emotion <- rowMeans(SDQ[items_emotion], na.rm=TRUE)*5

R_peerprobs2 < reverse.code(keys = c(1,-1,-1,1,1), SDQ[items_peerprobs2])
SDQ$S_peerprobs2 <- rowMeans(R_peerprobs2, na.rm = T)*5



