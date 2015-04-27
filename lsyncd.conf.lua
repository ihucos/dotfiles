
sync {
   default.rsync,
   source = "/home/resu/projects/sab/live",
   target = "sabineh@sabinehueck.de:sabmirror",
   exclude=".git/",
 }
