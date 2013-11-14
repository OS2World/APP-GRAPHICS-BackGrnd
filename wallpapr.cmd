/* WallRand rexx script                             */
/* Written by Chris Ingram  26-Nov-94               */
/* E-mail: Chris.Ingram@gtri.gatech.edu             */
/* Uses backgrnd.exe written by Johannes Martin     */
/*   ( jmartin@goofy.zdv.uni-mainz.de )             */
/* Purpose: Given a directory of gzipped bitmap     */
/*    files, it randomly picks one to make the      */
/*    desktop background.                           */
/*    The directory can also have subdirs of        */
/*    gzipped bitmaps.                              */

call RxFuncAdd 'SysFileSearch', 'RexxUtil', 'SysFileSearch'
call RxFuncAdd 'SysTempFileName', 'RexxUtil', 'SysTempFileName'
call RxFuncAdd 'SysFileTree', 'RexxUtil', 'SysFileTree'
parse upper arg DIRNAME FILENAME DODELETE EXTRA
if (DIRNAME='') | (FILENAME='') | \(EXTRA='') then
  call USAGE
if \(DODELETE='Y') & \(DODELETE='N') & \(DODELETE='') then
  call USAGE
if \(right(DIRNAME,1) = "\") then
  DIRNAME = insert(DIRNAME, "\")

RC = SysFileTree(insert(DIRNAME, "*.bmp.gz"), "file.", "FSO")
if (RC > 0) then
  call ERROR
RAND = Random(1, file.0, time('S'))
"gzip -c -d" file.RAND ">" insert(DIRNAME, FILENAME)
"backgrnd " insert(DIRNAME, FILENAME)
if (DODELETE='Y') then
  "del " insert(DIRNAME, FILENAME)
exit

USAGE:
  say
  say "Usage: wallpapr <Directory> <Filename> [Delete]"
  say "  Directory is where your *.bmp.gz wallpaper files exist."
  say "  Files can also exist in subdirectories of Directory."
  say "  Filename is the name of the file in that directory to make the wallpaper."
  say "  Delete may be Y or N and tells wallpapr whether it should delete"
  say "  filename after displaying the wallpaper or not."
  say "The following must be in your PATH:"
  say "  gzip.exe, backgrnd.exe"
  say "Example:"
  say "  wallpapr D:\WallPaper WallPapr.bmp"
  exit

ERROR:
  say
  say "ERROR getting filenames"
  exit

[End enclosure]

--
Chris.Ingram@gtri.gatech.edu
894-1911   CRB 314

