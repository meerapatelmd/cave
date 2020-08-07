pkgdown::build_favicons()
cave::create_dir_if_not_exist("man/figures")
mapply(file.copy,
       from = list.files("~/GitHub/Public-Packages/chariot/",
                         full.names = TRUE),
       to = paste0("man/figures", "/", basename(list.files("~/GitHub/Public-Packages/chariot/",
                                full.names = TRUE))))
