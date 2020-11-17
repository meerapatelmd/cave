#' @title
#' Create the Path to a Directory
#'
#' @description
#' Create a directory along with the intermediate directories if any do not already exist. A console message is returned indicating whether the directory already existed or if it was created by the function call.
#'
#' @rdname dir.create_path
#' @example inst/example/dir_mgmt.R
#' @family directory management functions
#'
#' @export

dir.create_path <-
        function(dir) {

                dir <-path.expand(dir)


                        # Split path to dir to make sure each directory exists recursively, otherwise create it
                        all_dirs <- unlist(strsplit(x = dir,
                                             split = .Platform$file.sep))

                        all_dirs <- no_blank(all_dirs)


                        dirs1 <- list()
                        for (i in seq_along(all_dirs)) {

                                if (i == 1) {

                                        dirs1[[i]] <- all_dirs[i]

                                } else {
                                        dirs1[[i]] <- c(dirs1[[i-1]], all_dirs[i])
                                }


                        }

                        formatted_dir_paths <- list()

                        for (i in seq_along(dirs1)) {

                                if (i == 1) {

                                        formatted_dir_paths[[i]] <- sprintf("%s%s",
                                                                            .Platform$file.sep,
                                                                            dirs1[[i]])


                                } else {

                                        formatted_dir_paths[[i]] <- do.call(what = file.path,
                                                                            args = as.list(dirs1[[i]]))
                                        formatted_dir_paths[[i]] <-
                                                sprintf("/%s", formatted_dir_paths[[i]])
                                }


                        }


                        for (i in seq_along(formatted_dir_paths)) {

                                if (!dir.exists(paths = formatted_dir_paths[[i]])) {

                                        dir.create(formatted_dir_paths[[i]])

                                        message(sprintf("%s directory created", formatted_dir_paths[[i]]))


                                } else {

                                        message(sprintf("%s already exists", formatted_dir_paths[[i]]))
                                }

                        }



        }

#' @title
#' Remove a Directory
#'
#' @description
#' Delete a directory if it does not contain any files.
#'
#' @rdname remove.dir
#' @example inst/example/dir_mgmt.R
#' @family directory management functions
#'
#' @export


remove.dir <-
        function(dir,
                 force = FALSE) {

                dir <- path.expand(dir)

                if (!dir.exists(dir)) {

                        stop("dir does not exist")
                }

                subdirs <- list.subdirs(dir = dir,
                                        full.names = TRUE,
                                        recursive = TRUE)



                dir_files <- list.files_only(dir = dir)

                dir_contents <- list()

                if (length(subdirs) > 0) {

                        dir_contents[[length(dir_contents)+1]] <- subdirs
                        names(dir_contents)[length(dir_contents)] <- "subdirs"

                }

                if (length(dir_files) > 0) {

                        dir_contents[[length(dir_contents)+1]] <- dir_files
                        names(dir_contents)[length(dir_contents)] <- "files"

                }


                if (length(dir_contents) > 0) {


                        message <- paste(names(dir_contents), collapse = " and ")
                        stop(sprintf("dir '%s' contains %s.", dir, message))


                }


                        unlink(x = dir,
                               recursive = TRUE,
                               force = force)

                        message(sprintf("'%s' removed.", dir))



        }

#' @title
#' List Subdirectories
#'
#' @description
#' List the subdirectories within a directory.
#'
#' @rdname list.subdirs
#'
#' @export


list.subdirs <-
        function(dir,
                 full.names = TRUE,
                 recursive = TRUE) {

                dir <- path.expand(dir)

                subdirs <- list.dirs(path = dir,
                                     full.names = full.names,
                                     recursive = recursive)

                subdirs[!(subdirs %in% dir)]
        }


#' @title
#' List Files without Subdirectories
#'
#' @description
#' List files in a given directory without including any folders.
#'
#' @rdname list.files_only
#'
#' @export


list.files_only <-
        function(dir,
                 full.names = TRUE,
                 recursive = TRUE) {

                dir <- path.expand(dir)

                subdirs <- list.subdirs(dir = dir,
                                        full.names = full.names,
                                        recursive = recursive)

                dir_files <- list.files(path = dir,
                                        full.names = full.names,
                                        recursive = recursive)
                dir_files[!(dir_files %in% subdirs)]

        }

#' @title
#' Copy a Folder
#' @param path_to_dir path to the folder to copy
#' @param destination_path path copied to. If the path does not exist, it will be created using `dir.create_path()`.
#'
#' @rdname copy_dir
#' @family directory management functions
#' @example inst/example/dir_mgmt.R
#' @export

copy_dir <-
        function(path_to_dir, destination_path) {

                new_path <- file.path(destination_path)
                new_path <- path.expand(new_path)

                dir.create_path(dir = new_path)
                file.copy(path_to_dir,
                          to = new_path,
                          recursive = TRUE)
        }
