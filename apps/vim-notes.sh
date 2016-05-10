#!/bin/bash
# TODO:


#Global variables #Change to your liking
FILE_EXTENSION="txt"
# Must be an absolute path, no home paths
# NOTES_DIRECTORY='/home/tekkidd/Documents/notes'
NOTES_DIRECTORY='/cluster/home/u330940/Documents/notes'
NAME_FORMAT="note-`date +%Y-%m-%d`.$FILE_EXTENSION"
BACKUP_FORMAT="backup-`date +%Y-%m-%d`"
BACKUP_DIRECTORY="$NOTES_DIRECTORY/backups"


function vn-vim-notes {
    if [ ! -d "$NOTES_DIRECTORY" ]; then
       /bin/mkdir "$NOTES_DIRECTORY"
    fi
    if [ -f ".$NAME_FORMAT.swp" ]; then
        echo "Another instance of notes is already running"
        return 1
    fi
    cd $NOTES_DIRECTORY
    if [ ! -f $NAME_FORMAT ]; then
        touch $NAME_FORMAT
        /usr/bin/vim $NAME_FORMAT
    else
        /usr/bin/vim $NAME_FORMAT
    fi
}
function vn-backup {
    # Check and make sure the notes directory exists
    if [ ! -d $NOTES_DIRECTORY ]; then
        echo "Notes directory does not exist"
        echo "Run notes without the --backup argument to fix this issue"
        exit 1
    fi
    # if the directory does not exist yet then create it
    if [ ! -d $BACKUP_DIRECTORY ]; then
        /bin/mkdir $BACKUP_DIRECTORY
    fi

   # Go into the directory and zip the files
   cd $NOTES_DIRECTORY
   /usr/bin/zip $BACKUP_FORMAT note-*
   mv  "$BACKUP_FORMAT.zip" $BACKUP_DIRECTORY
}
function vn-dir {
    if [ ! -d $NOTES_DIRECTORY ]; then
        echo "Notes directory not found, run 'notes' to resolve this issue"
    fi
    cd $NOTES_DIRECTORY
    echo `pwd`
}

function vn-special {
    CUSTOM_NOTE="$1".$FILE_EXTENSION
    echo $CUSTOM_NOTE
    if [ ! -d $NOTES_DIRECTORY ]; then
        /bin/mkdir "$NOTES_DIRECTORY"
    fi
    cd $NOTES_DIRECTORY
    if [ ! -f "$1" ]; then
        touch $CUSTOM_NOTE
        /usr/bin/vim $CUSTOM_NOTE
    else
        if [ -f "$SPECIAL_NOTE".swp ]; then
            echo "Note opened elsewhere"
            echo "Close the note or delete the swap file"
            return 1
        fi

        /usr/bin/vim $CUSTOM_NOTE
    fi

}
function vn-clean {
    echo "Removing old swap files"
    cd $NOTES_DIRECTORY
    /usr/bin/find . -name "*.swp" -type f -delete
    echo "[DONE]"
}

function vnhelp {
    printf "VIM Notes v2.0\n"
    printf "usage: notes\n"
    printf "   or: notes [arguments]\n"
    printf "Arguments:\n"
    printf " -b             Backup\n"
    printf " -d             Directory\n"
    printf " -s             Create a special note (custom name)\n"
    printf " --clean        Clean up the notes directory of all .swp files\n"
    printf " -h or --help   Access vim-notes help page\n"
}

#
#
#
#
function notes {
    if [ $# -eq 0 ];then
        vn-vim-notes
    else
        case "$1" in
            -d)
                (vn-dir)
                ;;
            -b)
                (vn-backup)
                ;;
            -s)
                (vn-special $2)
                ;;
            --clean)
                (vn-clean)
                ;;
            -h)
                (vnhelp)
                ;;
            --help)
                (vnhelp)
                ;;
            *)
            echo "vim-note: illegal argument"
            return 1
            ;;
    esac
fi
}

