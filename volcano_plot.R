# Volcano Plot

data <- data.frame(
  gene = paste0("Gene", 1:1000),
  logFC = rnorm(1000, 0, 2),
  pvalue = runif(1000, 0, 1)
)
data$neg_log <- -log(data$pvalue)
fold_change_threshold <- 1
pvalue_threshold <- 0.05

p1<-ggplot(data, aes(x = logFC, y = neg_log)) +
  geom_point(aes(color = (abs(logFC) > fold_change_threshold) & (pvalue < pvalue_threshold)), size = 2) +
  scale_color_manual(values = c("FALSE" = "grey", "TRUE" = "#1a1a1a")) +
  labs(title = "Volcano Plot", x = "Log2 Fold Change", y = "-Log P-value") +
  scale_y_continuous(breaks = seq(0, 8, by = 1)) +
  scale_x_continuous(breaks = seq(-10, 10, by = 1)) +
  geom_vline(xintercept = 0, linetype = "dashed") +
  geom_vline(xintercept = c(-fold_change_threshold, fold_change_threshold), linetype = "dashed") +
  geom_hline(yintercept = 3, linetype = "dashed") +
  theme(
    legend.position = "none",
    panel.background = element_rect(fill = "#f2f2f2", colour = "#f2f2f2", size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "#dbe3db"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "#dbe3db"),
    axis.title.x = element_text(size = 14),
    axis.text.x = element_text(size = 12),
    axis.title.y = element_text(size = 14),
    axis.text.y = element_text(size = 12),
    panel.border = element_rect(colour = "black", fill = NA, size = 0.5)
  )

p1
