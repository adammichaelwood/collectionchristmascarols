﻿\version "2.14.2"
\include "../util.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premier Pro Semibold"){ \abs-fontsize #15 \smallCapsOldStyle"The Wassail Song"}}
  poet = \markup\oldStyleNum"Traditional"
  composer = \markup\oldStyleNum"Traditional (Yorkshire)"
  tagline = \markup { "from" \italic {Christmas Carols, New and Old}}
}
\paper {
  paper-height = 9\in
  paper-width = 6\in
  indent = 0\in
  %system-system-spacing = #'((basic-distance . 10) (padding . 0))
  system-system-spacing =
    #'((basic-distance . 0)
       (minimum-distance . 0)
       (padding . -20)
       (stretchability . 100))
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  two-sided = ##t
  inner-margin = 0.5\in
  outer-margin = 0.25\in
  first-page-number = #075
  print-first-page-number = ##t
  headerLine = \markup{\override #'(font-name . "Garamond Premier Pro") \smallCapsOldStyle"christmas"}
  oddHeaderMarkup = \markup\fill-line{
     \override #'(font-name . "Garamond Premier Pro")\abs-fontsize #8.5
     \combine 
        \fill-line{"" \on-the-fly #print-page-number-check-first
        \oldStylePageNum""
        }
        \fill-line{\headerLine}
  }
  evenHeaderMarkup = \markup {
     \override #'(font-name . "Garamond Premier Pro")\abs-fontsize #8.5
     \combine
        \on-the-fly #print-page-number-check-first
        \oldStylePageNum""
        \fill-line{\headerLine}
  }
}
#(set-global-staff-size 14.6) \paper{ #(define fonts (make-pango-font-tree "GoudyOlSt BT" "Garamond Premier Pro" "Garamond Premier Pro" (/ 14.6 20))) }
global = {
  \key e \major
  \time 6/8
  \override DynamicLineSpanner #'staff-padding = #0.0
  \override DynamicLineSpanner #'Y-extent = #'(-1 . 1)
}

sopMusic = \relative c' {
  \time 6/8
  \partial 8 e8 |
  e4 fis8 gis4 fis8 |
  \slurDotted e4( fis8) gis4 fis8 |
  e4 b'8 b4 b8 |
  
  \partial 8*5 \slurSolid b4.( b4) | 
  \partial 8 b8 |
  cis4 cis8 b4 gis8 |
  b4.( a4) gis8 |
  \slurDotted fis4( e8) fis4 gis8 |
  \partial 4. a4. \bar "||"
  
  \time 2/2
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark "Chorus"
  \partial 2 gis4 a |
  b2 e4 cis |
  b2 gis4 a |
  b b e cis |
  b2 gis4 a |
  b2 cis4 gis |
  
  \slurSolid a( fis) e dis |
  e4.( fis8) gis4 e |
  a2 gis4 a |
  b2 cis4 gis |
  a fis e( dis) |
  \partial 2 e2 \bar ":|" 
  
  
  
  \time 6/8 
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark "Additional Verses"
  \partial 8 e8 |
  e4 fis8 gis4 fis8 |
  \slurDotted e4( fis8) gis4 fis8 |
  e4 b'8 b4 b8 |
  
  \partial 8*5 \slurSolid b4.( \slurDotted b4) | 
  \partial 8 b8 |
  cis4 cis8 b4 gis8 |
  b4( b8)( a4) gis8 |
  fis4 e8 fis4 gis8 |
  \partial 4. a4. \bar "||"
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  \time 6/8
  e8 |
  e4 e8 dis4 dis8 |
  \slurDotted e4( e8) dis4 dis8 |
  e4 e8 a4 gis8 |
  
  fis4.~ fis4 fis8 |
  a4 e8 e4 e8 |
  \slurSolid fis4.( dis4) e8 |
  \slurDotted cis4( e8) dis4 e8 |
  dis4. \bar "||"
  
  
  e4 dis |
  e2 e4 fis |
  gis2 e4 dis |
  e dis gis e |
  dis2 gis4 fis |
  fis2 eis4 eis |
  
  \slurSolid fis( cis) b b |
  b4.( dis8) e4 e |
  cis( dis) e e |
  fis2 cis4 cis |
  cis cis b2 |
  b2 \bar ":|"
  
  
  
  
  \time 6/8 
  e8 |
  e4 e8 dis4 dis8 |
  \slurDotted e4( e8) dis4 dis8 |
  e4 e8 a4 gis8 |
  
  fis4.~ fis4 fis8 |
  a4 e8 e4 e8 |
  fis4( fis8)( dis4) e8 |
  cis4 e8 dis4 e8 |
  dis4. \bar "||"
}
dropLyrics =
{
    \override LyricText #'extra-offset = #'(0 . -0.9)
    \override LyricHyphen #'extra-offset = #'(0 . -0.9)
    \override LyricExtender #'extra-offset = #'(0 . -0.9)
}

raiseLyrics =
{
    \revert LyricText #'extra-offset
    \revert LyricHyphen #'extra-offset
    \revert LyricExtender #'extra-offset
}
altoWords = {
  \lyricmode {
    \set stanza = #"1. "
    \set ignoreMelismata = ##t
    _ Here we come a -- was -- sail -- ing A -- mong the leaves so green, _ _
    Here we come a -- wan -- d’ring, So fair __ _ to be seen.
    
    \unset ignoreMelismata
    \repeat unfold 34\skip1
    \set stanza = #"4. "
    \set ignoreMelismata = ##t
    We have a lit -- tle purse __ _ Made of ratch -- ing leath -- er skin; _
    We want some of your small _ change To line it well with -- in.
  }
}
altoWordsII = {
  \set stanza = \markup{\dynamic"mf  " "2. "}
  \lyricmode {
    \set ignoreMelismata = ##t
    We are not dai -- ly beg -- _ gars That beg from door to door, _
    But we are neigh -- bors’ chil -- dren Whom you have seen be -- fore.
    \unset ignoreMelismata
  }
  \set stanza = \markup\dynamic"f "
  \lyricmode {
    \set associatedVoice = "altos"
    Love and joy come to you, And to you your was -- sail too,
    And God bless you, and send you a hap -- py new year,
    \unset associatedVoice
    And God
    \dropLyrics
    send you a hap -- py new year.
    \raiseLyrics
    
    \set stanza = #"5. "
    \set ignoreMelismata = ##t
    Call up the But -- ler of this house, Put on his gold -- den ring; _
    Let him bring us a glass of beer, The bet -- ter we shall sing.
  }
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  \set ignoreMelismata = ##t
  Good Mas -- ter and good Mis -- _ tress, As you sit by the fire, __ _
  Pray think of us poor chil -- dren Who wan -- der in the mire.
  
  \repeat unfold 37\skip1
  \set stanza = #"6. "
  \set ignoreMelismata = ##t
  \skip1 Bring us out a ta -- _ ble And spread it with a cloth; _ _
  Bring us out a cheese, __ _ _ And of your Christ -- mas loaf.
}
altoWordsIV = \lyricmode {
  \repeat unfold 58\skip1
  \set stanza = #"7. "
  \set ignoreMelismata = ##t
  God bless the mas -- ter of this house, Like -- wise the mis -- tress too; __ _
  And all the lit -- tle chil -- _ dren That round the ta -- ble go.
}
altoWordsV = \lyricmode {
}
altoWordsVI = \lyricmode {
}
altoWordsVII = \lyricmode {
}
tenorMusic = \relative c' {
  \time 6/8
  gis8 |
  gis4 a8 b4 a8 |
  \slurDotted gis4( a8) b4 a8 |
  gis4 b8 dis4 e8 |
  
  dis4.~ dis4 dis8 |
  e4 a,8 b4 b8 |
  b4.~ b4 b8 |
  cis4( b8) a4 gis8 |
  fis4. \bar "||" 
  
  
  b4 b |
  b2 cis4 dis |
  e2 b4 b |
  b b b ais |
  b2 b4 cis |
  b2 b4 b |
  
  a2 gis4 fis |
  \slurSolid gis4.( a8) b4 cis |
  a2 b4 cis |
  b2 gis4 b |
  a4 a gis( fis) |
  gis2 \bar ":|"
  
  
  
  
  \time 6/8 
  gis8 |
  gis4 a8 b4 a8 |
  \slurDotted gis4( a8) b4 a8 |
  gis4 b8 dis4 e8 |
  
  dis4.~ dis4 dis8 |
  e4 a,8 b4 b8 |
  b4( b8)( b4) b8 |
  cis4 b8 a4 gis8 |
  fis4. \bar "||" 
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  \time 6/8
  e8 |
  e4 e8 b4 b8 |
  \slurDotted e4( e8) b4 b8 |
  e4 gis8 fis4 e8 |
  
  b'4.~ b4 b8 |
  a4 a8 gis4 e8 |
  \slurSolid dis4.( fis4) e8 |
  \slurDotted a4( gis8) fis4 e8 |
  b4. \bar "||"
  
  e4 fis |
  gis2 a4 a |
  e2 e4 fis |
  gis fis e fis |
  b,2 e4 e |
  dis2 cis4 cis |
  
  \slurSolid fis( a,) b b |
  gis'4.( fis8) e4 cis |
  fis2 e4 cis |
  dis2 eis4 eis |
  fis4 a, b2 |
  e2 \bar ":|"
  
  
  
  
  
  \time 6/8 
  e8 |
  e4 e8 b4 b8 |
  \slurDotted e4( e8) b4 b8 |
  e4 gis8 fis4 e8 |
  
  b'4.~ b4 b8 |
  a4 a8 gis4 e8 |
  dis4( dis8)( fis4) e8 |
  a4 gis8 fis4 e8 |
  b4. \bar "||"
}
bassWords = \lyricmode {

}

\score {
  <<
   \new ChoirStaff <<
%    \new Lyrics = sopranos \with { \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) }
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \sopWords
    \new Lyrics = "altosVII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVII
    \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "basses" \bassWords
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
  \layout {
    \context {
      \Score
      %\override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 8)
      %\override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4)
    }
    \context {
      % Remove all empty staves
      % \Staff \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t
    }
  }
}
