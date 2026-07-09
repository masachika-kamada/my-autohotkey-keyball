;直前のキー入力を追跡する変数
global lastKeyWasNumber := false

;全角入力モードでの数字入力を半角に変換する
0::
{
  global lastKeyWasNumber
  Send("{U+0030}")
  lastKeyWasNumber := true
  return
}
1::
{
  global lastKeyWasNumber
  Send("{U+0031}")
  lastKeyWasNumber := true
  return
}
2::
{
  global lastKeyWasNumber
  Send("{U+0032}")
  lastKeyWasNumber := true
  return
}
3::
{
  global lastKeyWasNumber
  Send("{U+0033}")
  lastKeyWasNumber := true
  return
}
4::
{
  global lastKeyWasNumber
  Send("{U+0034}")
  lastKeyWasNumber := true
  return
}
5::
{
  global lastKeyWasNumber
  Send("{U+0035}")
  lastKeyWasNumber := true
  return
}
6::
{
  global lastKeyWasNumber
  Send("{U+0036}")
  lastKeyWasNumber := true
  return
}
7::
{
  global lastKeyWasNumber
  Send("{U+0037}")
  lastKeyWasNumber := true
  return
}
8::
{
  global lastKeyWasNumber
  Send("{U+0038}")
  lastKeyWasNumber := true
  return
}
9::
{
  global lastKeyWasNumber
  Send("{U+0039}")
  lastKeyWasNumber := true
  return
}
`::
{
  global lastKeyWasNumber
  Send("{U+0060}")
  lastKeyWasNumber := false
  return
}
_::
{
  global lastKeyWasNumber
  Send("{U+005F}")
  lastKeyWasNumber := false
  return
}
#::
{
  global lastKeyWasNumber
  Send("{U+0023}")
  lastKeyWasNumber := false
  return
}
*::
{
  global lastKeyWasNumber
  Send("{U+002A}")
  lastKeyWasNumber := false
  return
}
(::
{
  global lastKeyWasNumber
  Send("{U+0028}")
  lastKeyWasNumber := false
  return
}
)::
{
  global lastKeyWasNumber
  Send("{U+0029}")
  lastKeyWasNumber := false
  return
}
|::
{
  global lastKeyWasNumber
  Send("{U+007C}")
  lastKeyWasNumber := false
  return
}
@::
{
  global lastKeyWasNumber
  Send("{U+0040}")
  lastKeyWasNumber := false
  return
}

; 日本語入力時に、数字の後に。を打つときは絶対に 3.14 のようにピリオドになるので、半角に固定
.::
{
  global lastKeyWasNumber
  if (lastKeyWasNumber) {
    Send("{U+002E}")  ; 半角ピリオド
  } else {
    ; 無限ループを防ぐため、一時的にホットキーを無効化
    Hotkey(".", "Off")
    Send("{vkBE}")
    ; 少し待ってからホットキーを再有効化
    SetTimer(() => Hotkey(".", "On"), -50)
  }
  lastKeyWasNumber := false
}

; 主要なキーでフラグをリセット（キー入力はブロックしない）
~Space::
~Enter::
~Tab::
~Backspace::
~Delete::
~a::
~b::
~c::
~d::
~e::
~f::
~g::
~h::
~i::
~j::
~k::
~l::
~m::
~n::
~o::
~p::
~q::
~r::
~s::
~t::
~u::
~v::
~w::
~x::
~y::
~z::
{
  global lastKeyWasNumber
  lastKeyWasNumber := false
  return
}

; New Outlook でCtrl+Enter を無効化（誤送信防止）
#HotIf WinActive("ahk_exe olk.exe")
^Enter::return
#HotIf
