library("igraph")
conf_pencil <- graph(c(
  1,3, 1,14, 1,15, 1,18, 1,20, 1,33,
  2,12, 2,13, 2,21,
  3,20, 3,33, 3,34,
  4,8, 4,11,
  6,16,
  7,19,
  8,9, 8,11,
  12,13,
  13,21,
  14,15, 14,18, 14,20, 14,33,
  15,18, 15,20, 15,33,
  16,30,
  18,20, 18,33,
  20,33,
  24,28
), n=35, directed=FALSE)
plot(conf_pencil, main = "Variants of PENCIL") 

groups.conf_pencil <- list(
  c(4,8,11),
  c(2,12,13,21),
  c(1,3,14,15,18,20,33),
  c(5),
  c(10),
  c(17),
  c(22),
  c(23),
  c(25),
  c(26),
  c(27),
  c(29),
  c(31),
  c(32),
  c(35),
  c(3,34),
  c(6,16),
  c(7,19),
  c(8,9),
  c(16,30),
  c(24,28)
)
plot(conf_pencil, mark.groups = groups.conf_pencil, main = "Variants of PENCIL")



conf_pen <- graph(c(
  2,10, 2,15, 2,20,
  3,4, 3,8, 3,12, 3,14, 3,22, 3,24, 3,26,
  5,10, 5,15,
  6,7, 6,16, 6,18, 6,25,
  9,15, 9,21,
  12,14, 12,24,
  14,24,
  18,25,
  22,26
), n=26, directed=FALSE)
plot(conf_pen, main = "Variants of PEN")

groups.conf_pen <- list(
  c(6,18,25),
  c(3,22,26),
  c(3,12,14,24),
  c(2,5,10,15),
  c(1),
  c(11),
  c(13),
  c(17),
  c(19),
  c(23),
  c(2,20),
  c(3,4),
  c(3,8),
  c(6,7),
  c(6,16),
  c(9,15),
  c(9,21)
)
plot(conf_pen, mark.groups = groups.conf_pen, main = "Variants of PEN")



conf_marker <- graph(c(
  1,6, 1,8, 1,15,
  2,41,
  3,11, 3,22, 3,33,
  5,7, 5,18, 5,29,
  6,15,
  11,36,
  18,29,
  20,28,
  22,33,
  24,35,
  42,44
), n=48, directed=FALSE)
plot(conf_marker, main = "Variants of MARKER")

groups.conf_marker <- list(
  c(5,18,29),
  c(3,22,33),
  c(1,6,15),
  c(4),
  c(9),
  c(10),
  c(12),
  c(13),
  c(14),
  c(16),
  c(17),
  c(19),
  c(21),
  c(23),
  c(25),
  c(26),
  c(27),
  c(30),
  c(31),
  c(32),
  c(34),
  c(37),
  c(38),
  c(39),
  c(40),
  c(43),
  c(45),
  c(46),
  c(47),
  c(48),
  c(1,8),
  c(2,41),
  c(3,11),
  c(5,7),
  c(11,36),
  c(20,28),
  c(24,35),
  c(42,44)
)
plot(conf_marker, mark.groups = groups.conf_marker, main = "Variants of MARKER")
