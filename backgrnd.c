#define INCL_WIN

#include <os2.h>
#include <string.h>

VOID main(int argc, char *argv[])
{
  HAB hab;
  HMQ hmq;
  HOBJECT hObject;
  char name[300];

  hab = WinInitialize(0);
  hmq = WinCreateMsgQueue(hab, 0);
  hObject = WinQueryObject("<WP_DESKTOP>");
  strcpy(name, "BACKGROUND=");
  strcat(name, (argc >= 2) ? argv[1] : "(none)");
  WinSetObjectData(hObject, name);
  WinDestroyMsgQueue(hmq);
  WinTerminate(hab);
}
