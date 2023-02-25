; =============== *** VKC0 SCRIPTS *** =====================

; ----------------------------------------------------------
; Switch virtual desktops
; ----------------------------------------------------------

VKC0 & ]:: ; Switch to right
Send, {LControl down}#{Right}{LControl up}
return

VKC0 & +:: ; Switch to left
Send, {LControl down}#{Left}{LControl up}
return

; ----------------------------------------------------------
; Mouse Block and hide
; ----------------------------------------------------------

VKC0 & g::
if (flag := !flag) {
  MouseGetPos, , , hwnd
  Gui Cursor:+Owner%hwnd%
  BlockInput MouseMove
  DllCall("ShowCursor", Int,0)

  mouse_blocked := true   ; assign the boolean value "true" or "1" to this variable
  #if (mouse_blocked) ; if this variable has the value "true"

    ; block mouse input:
    lbutton::
    rbutton::
    wheelup::
    wheeldown::
    return

  #if ; turn off context sensitivity

} else {
   BlockInput MouseMoveOff
   DllCall("ShowCursor", Int,1)
   mouse_blocked := false
}
Return

; ----------------------------------------------------------
; Move options - Vim maps
; ----------------------------------------------------------

VKC0 & d::
Send, {Left}
return

VKC0 & h::
Send, {Up}
return

VKC0 & t::
Send, {Down}
return

VKC0 & n::
Send, {Right}
return

; ----------------------------------------------------------
; Numpad in the right hand
; ----------------------------------------------------------

VKC0 & s:: Numpad := !Numpad
#if Numpad
Space::Numpad0
m::Numpad1
w::Numpad2
v::Numpad3
h::Numpad4
t::Numpad5
n::Numpad6
g::Numpad7
c::Numpad8
r::Numpad9
#IF

; ----------------------------------------------------------
;
; ----------------------------------------------------------
